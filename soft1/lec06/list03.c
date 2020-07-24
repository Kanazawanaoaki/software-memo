#include <stdio.h>

int main(void)
{
  int a;
  double x;

  printf("整数を入力してください\n");
  scanf("%d" ,&a);
  printf("浮動小数点数を入力してください\n");
  scanf("%lf" ,&x);

  printf("a=%d x=%lf \n", a,x);

  return 0;

} 
