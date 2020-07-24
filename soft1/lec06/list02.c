#include <stdio.h>

int main(void)
{
  int a,b;
  double x,y;
  char ch;

  a = 100;
  b = 200;
  x = 123.4;
  y = x;
  ch = 'X';

  printf("a = %d \n", a); //画面への表示
  printf("b = %d \n", b);
  printf("x = %lf \n", x);
  printf("y = %lf \n", y);
  printf("ch = %c \n", ch);
  return 0;

}
