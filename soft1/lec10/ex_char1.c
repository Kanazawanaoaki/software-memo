/* 配列要素を別の配列にコピー(ex_char1.c) */
#include<stdio.h>
#include<string.h>

int main(void){
  char *p = "Room E31";
  char str1[]="木", str2[]="水曜日";
  int i;
  printf("p = \"%s\", length = %lu\n", p, strlen(p));
  for(i=0;i<=strlen(p);i++)
    printf("p[%d]= \"%c\"\n",i,p[i]);
  p = "水曜日";
  printf("p[0,1,2] = \"%c%c%c\"\n",p[0],p[1],p[2]);
  printf("p[3,4,5] = \"%c%c%c\"\n",p[3],p[4],p[5]);
  printf("p[6,7,8] = \"%c%c%c\"\n",p[6],p[7],p[8]);
  printf("p[9] = \"%c\"\n",p[9]);
  printf("p = \"%s\", length = %lu\n",p,strlen(p));
  printf("str2 = \"%s\", length = %lu\n", str2, strlen(str2));
  str2[0]=str1[0];
  str2[1]=str1[1];
  str2[2]=str1[2];
  printf("str2 = \"%s\", length = %lu\n", str2, strlen(str2));
  return 0;
}   
