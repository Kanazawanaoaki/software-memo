#include<stdio.h>

int a = 1;
void func(void){
  int a = 2;
  for(;;){
    int a = 3;
    printf("a=%d\n", a); // a=3
    break;
  }
  printf("a=%d\n",a); // a=2
}

int main(void){
  printf("a=%d\n",a); // a=1
}
