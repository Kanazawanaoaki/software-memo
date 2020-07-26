#include<stdio.h>
#include<stdlib.h>

int main(void){
  char line[128]; int y,m,d;
  fgets(line,sizeof(line),stdin);
  sscanf(line, "y%dm%dd%d",&y,&m,&d);
  printf("y=%d m=%d d=%d \n",y,m,d);
}
