/* ポインタによる変数の値の書き換え(ex1.c)*/
#include<stdio.h>

int main(void){
  int x=0;
  int a=1;
  int *p;

  printf("Address of x = %p \n", &x);
  printf("Value of x = %d\n", x);
  p = &x;
  *p = 10;
  a = *p;
  printf("Address of x = %p \n", p);
  printf("Value of x = %d \n", x);
  printf("Value of a = %d \n", a);
  return 0;
}
