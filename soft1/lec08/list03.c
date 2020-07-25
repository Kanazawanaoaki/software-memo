#include<stdio.h>

int main(void)
{
  int i;
  int a[5];

  for(i=0;i<5;i++){
    a[i]=i; //i番目の要素に値iを代入
    printf("a[%d] = %d \n", i, a[i]);
  }

  return 0;
}
