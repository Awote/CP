section .data
edge dd 0,0,0,0,0,0,0,0,0,0
result db '%i', 0xA, 0x0

section .text
global main
extern printf

main:
mov ebx, 0 ;count rez sum of elements
mov ecx,10 ; for array 
mov esi ,edge ;first element of array
xor eax,eax


for_arr:
lodsw ; eax = элемент массива (число) 
or eax,00001111b
;дописываем 4-е единицы
; add_regs_to_steck:
; push ecx
; mov edi,1
; mov ecx,4
; test:
; bts [eax],edi
; inc edi
; dec ecx
; cmp ecx,0
; jnz test
; pop ecx
; xor edi,edi
add ebx,eax  ;добавляем значение жлемента
xor eax,eax
 ; dec ecx  

loop for_arr


 

; dec_reg:
; dec esi
done:
push  ebx
push result
call printf

mov eax, 1 ;номер системного вызова (sys_exit)
mov ebx, 0 ;код возврата
int 0x80
