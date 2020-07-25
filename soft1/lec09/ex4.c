/* 配列要素の合計を求める(ex4.c)*/
#include<stdio.h>

int main(void){
  int a[10] = {1,2,3,4,5,6,7,8,9,0};
  int i, sum, *p;

  p = &a[0];
  sum = 0;
  while(*p){
    sum += *p++; /* *(p++)をsumに加える処理を要素’'に遭遇するまで繰り返す*/
  }
  printf("sum = %d \n", sum);

  return 0;
}
