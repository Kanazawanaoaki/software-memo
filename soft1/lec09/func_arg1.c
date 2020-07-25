#include<stdio.h>

int ex_sub(int num);

int main(void)
{
  int rc;
  int num = 100;

  rc = ex_sub(num);
  printf("num = %d \n", num);
  printf("rc = %d \n", rc);

  return 0;
}

int ex_sub(int num)
{
  num = num * 50;

  return (num);
}
