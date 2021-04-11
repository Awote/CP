#include <iostream>
#include <random>

using namespace std;

extern "C" {
	
	const int razmer = 10; 

	int FinalArr[razmer];

	int array[razmer][razmer];
};

int main()
{

	for (int i = 0; i < razmer; ++i)
	{
		for (int j = 0; j < razmer; ++j)
		{
			array[i][j] = 0 + rand() % 100;
		}
	}

	__asm
	(
	R"(
		.intel_syntax noprefix
		
		mov esi, 0				;//  адрес элементов одномерного массива	
		mov ecx, 0				;// адрес элементов двумерного массива
		mov dl, 0				;// количество пройденных строк

			StartLine:
		mov dh, 0				;//  количество пройденных элементов массива
		//mov ebx, 11	            ;//  макс элемент
		mov ebx ,0
			Main:
		mov eax, array[ecx]	    ;//  текущий (проверяемый) элемент	
		cmp eax,ebx
		jg Max
		//jl MaxElement

		jmp Inc

			Max:
		mov ebx, eax

			Inc:
		add ecx, 4
		add dh, 1

			EndLine:
		cmp dh, 10
		jl Main

		mov FinalArr[esi], ebx
		//mov ebx,11
		add esi, 4

			EndArray:
		add dl, 1
		cmp dl, 10
		jl StartLine
	;//}
	.att_syntax
	)"
	);

	for (int i = 0; i < razmer; i++)
	{
		for (int j = 0; j < razmer; j++)
		{
			cout << array[i][j] << " ";
		}
		cout << endl;
		
	}
	cout<<'\n';

	for (int i = 0; i < razmer; i++)
	{
		cout << FinalArr[i] << " ";
	}
	cout << endl;

	return 0;
}
