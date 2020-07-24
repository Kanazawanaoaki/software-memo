#include <stdio.h>

int main(void)
{
  double radius=5.0;
  double circle , area;
  const double PI=3.14159;

  circle = 2 * PI * radius;
  area = PI * radius * radius;

  printf("circle = %lf area = %lf \n", circle , area);

  return 0;

}
