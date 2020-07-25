/* 文字列の書き換え(配列版)(ex5_array.c) */

#include<stdio.h>

int main(void){
  char str[] = "SUN";

  printf("str = \"%s\"\n", str);
  str = "MON"; /*エラー発生！*/
  printf("str = \"%s\"\n", str);
  return 0;
}
