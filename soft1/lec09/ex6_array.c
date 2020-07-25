/* 配列版(ex6_array.c) */

#include <stdio.h>

int main(void){
  int i;
  char msg[] = "C programming";

  /*終端を見つけるまで繰り返す*/
  for(i=0; msg[i] != '\0';i++)
    {
      putchar(msg[i]);
    }
  putchar('\n');
  return 0;
}
