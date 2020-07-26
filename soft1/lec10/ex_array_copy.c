/* 配列要素を別の配列にコピー(ex_array_copy.c) */
#include<stdio.h>

int main(void){
  int i;
  int a[5] = {5,15,25}; /* {5,15,25,0,0}で初期化*/
  int b[5];

  for(i=0;i<5;i++)
    b[i]=a[i];
  printf("   a   b\n");
  printf("--------\n");
  for(i=0;i<5;i++)
    printf("%4d%4d\n",a[i],b[i]);
  return 0;
}
