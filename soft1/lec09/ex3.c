/* ポインタ変数の初期化と演算(ex3.c)*/
#include<stdio.h>

int main(void){
  char base1 = 'a';
  int base2 = 1;
  int i;
  char *p = &base1;
  int *q = &base2;

  for(i=0;i<5;i++){
    printf("%p\n",p+i);
    printf("%p\n",q+i);
  }
  return 0;
}
