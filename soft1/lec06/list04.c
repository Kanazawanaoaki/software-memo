#include <stdio.h>

int main(void)
{
  double x,y,z;

  printf("数値を入力してください\n");
  scanf("%lf" ,&x);
  printf("数値を入力してください\n");
  scanf("%lf" ,&y);

  z = x * y;

  printf("z=%lf \n", z);

  return 0;

}
