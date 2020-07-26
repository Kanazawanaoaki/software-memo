#include<stdio.h>
#include<stdlib.h>

int main(void){
  char line[256]; int id; char name[128]; double score;
  fgets(line,sizeof(line),stdin);
  sscanf(line, "%d,%[A-Za-z ],%lf",&id,name,&score);
  printf("id=%d name=\"%s\" score=%lf\n",id,name,score);
}
