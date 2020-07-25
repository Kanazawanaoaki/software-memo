/* ポインタ変数の加減算(ex2.c)*/
#include <stdio.h>

int main()
{
  int a[3] = {100 ,200 ,300};
  int *p;
  double d1 = 1.0;
  double *dp;
  p = &a[0];
  dp = &d1;
  printf("p = %p, dp = %p \n", p, dp);
  p++;
  dp--;
  printf("p++ = %p, dp-- = %p \n", p, dp);
  return 0;
}
