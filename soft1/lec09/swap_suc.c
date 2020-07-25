/* スワップ（修正版） */
#include<stdio.h>

void swap(int *a,int *b){
  int temp;

  temp = *a;
  *a = *b;
  *b = temp;
}

int main(void){
  int x,y;

  x=5;y=3;
  swap(&x,&y);
  printf("x=%d\t y=%d\n", x, y);
  return 0;
}
