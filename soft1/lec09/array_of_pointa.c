#include <stdio.h>

int main(void){
  char *w[] = {"SUN","MON","TUE"};
  int k;

  for(k=0;k<sizeof(w)/sizeof(w[0]);k++){
    printf("%d: %s", k, w[k]);
  }
  printf("\n");
  return 0;
}
