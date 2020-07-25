#include <stdio.h>

double f(double x, double y);

int main(void)
{
  double x,y,z;
  printf("Input x, y : \n");
  scanf("%lf %lf", &x, &y);

  z=f(x,y);

  printf("z = %lf \n", z);
  return 0;
}

double f(double x, double y){
  return (x*x+y*y);
}
