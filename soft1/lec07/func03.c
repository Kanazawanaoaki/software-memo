#include <stdio.h>
#include <math.h>

int main(void)
{
  double x,y;
  printf("input x: \n");
  scanf("%lf",&x);

  y=sin(x);

  printf("y = %lf \n", y);

  return 0;
}
