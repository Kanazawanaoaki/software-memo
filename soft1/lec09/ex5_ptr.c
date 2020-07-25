/* 文字列の書き換え(ポインタ版)(ex5_ptr.c) */

#include<stdio.h>

int main(void){
  char *p = "SUN";

  printf("p = \"%s\"\n", p);
  p = "MON";
  printf("p = \"%s\"\n", p);
  p = "TUESDAY";
  printf("p = \"%s\"\n", p);
  p = "水曜日";
  printf("p = \"%s\"\n", p);
  return 0;
}
