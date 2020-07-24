#include <stdio.h>

double f(double x){
  double result;
  result = x*x - 2*x;
  return result;
}

int main(void)
{
  double x,y;
  printf("input x: \n");
  scanf("%lf",&x);

  y=f(x);

  printf("y = %lf \n", y);

  return 0;
}
