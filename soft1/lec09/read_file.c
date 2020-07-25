#include<stdio.h>
#include<string.h>

int main(void){
  FILE *fp; char line[256];
  int id; char name[128]; double score;
  /* ファイルを開く */
  fp = fopen("sample.txt","r");
  fgets(line,sizeof(line),fp);
  sscanf(line,"%d,%[^,],%lf",&id,name,&score);
  /* データの表示 */
  printf("id: %d\n",id);
  printf("name: %s\n",name);
  printf("score: %lf\n",score);
  /* ファイルを閉じる */
  fclose(fp);
}
