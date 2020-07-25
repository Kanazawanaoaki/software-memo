#include <stdio.h>

int main(void)
{
  int num1,num2;
  printf("Input num1, num2 ?\n");
  scanf("%d%d",&num1,&num2);

  if(num2==0)
    printf("Error! Can't divide by 0\n");
  else
    printf("Ans=%lf\n",(double)num1/num2);

  return 0;
}
