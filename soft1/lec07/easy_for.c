#include<stdio.h>

int main(void)
{
  int i, num;
  printf("Input num ?\n");
  scanf("%d", &num);

  for(i=1; i<num+1;i=i+1)
    printf("%d", i);
  printf("End \n");
  return 0;
}
