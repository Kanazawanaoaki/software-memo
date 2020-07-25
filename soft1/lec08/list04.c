#include<stdio.h>

#define ARRAY_SIZE 5 //マクロを用いて配列のサイズを定義

int main(void)
{
  int i;
  int a[ARRAY_SIZE];

  for(i=0; i<ARRAY_SIZE; i++){
    a[i]=i; //i番目の要素に値iを代入
    printf("a[%d] = %d\n", i, a[i]);
  }

  return 0;
}
