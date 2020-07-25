/* 配列版(ex6_ptr.c) */

#include <stdio.h>

int main(void){
  char *p;
  char *msg = "C programming";

  /*終端を見つけるまで繰り返す*/
  for(p=msg; *p != '\0';p++)
    {
      putchar(*p);
    }
  putchar('\n');
  return 0;
}
