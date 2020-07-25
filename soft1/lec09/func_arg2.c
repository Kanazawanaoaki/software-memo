#include<stdio.h>
#define MAX 5
int goukei(int dt[]);

int main(void)
{
  int a[MAX] = {1,2,3,4,5};
  int sum;

  sum = goukei(a);

  printf("sum = %d \n", sum);

  return 0;
}

int goukei(int dt[])
{
  int kei = 0;

  for(int i=0;i<MAX;i++){
    kei += dt[i];
  }
  return (kei);
}
