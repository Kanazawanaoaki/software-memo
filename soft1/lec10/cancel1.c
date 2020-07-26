/* 桁落ち */
#include <stdio.h>
#include <math.h>

int main(void){
  double x;
  double f1;
  char buf[40];

  printf(" x = ");
  fgets(buf,sizeof(buf),stdin);
  sscanf(buf, "%lf", &x);
  if(x != 0.0){
    f1 = sqrt(1+x) - sqrt(x);
    printf(" f1 = %15.12lf\n", f1);
  }
  return(0);
}
