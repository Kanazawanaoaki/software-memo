/* 1次元配列の要素の総和を計算 (ex_array_sum1d.c) */
#include <stdio.h>
#define MAX 3
int sum1d(int p[]); // int sum1d(int *p); と同義

int main(void){

  int array[MAX] = {1,2,3};
  int sum;

  sum = sum1d(array);
  printf("sum = %d \n", sum);
  
  return 0;
}

int sum1d(int p[]){ // int p[] は int *pと同義
  int s1 = 0;
  int i;

  for(i=0;i<MAX;i++)
    s1 += p[i]; // p[1]:*(p+1)と同義
  return (s1);
}
  
