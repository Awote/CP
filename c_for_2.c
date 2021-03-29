#include <stdio.h>

int main()
    
{   int bit = 15;
    int tmp = 0;
    int test = 0;
    int final_count = 0;
    int a [10] = {0,0,0,0,0,0,0,0,0,0};
    for (int i =0;i < 10;i++)
    {   
        
        test = a[i];
        tmp = test| bit;
        final_count = final_count+tmp;
        
        
    }
    printf("rez\n");
    printf("%i",final_count);
    printf("\n");
    return 0;
}

