#include<stdio.h>
#include<string.h>

int main(void){
  FILE *fp;
  char line[128]; int len;
  int id; char name[128]; double score;
  /*ファイルを開く*/
  fp = fopen("sample.txt","w");
  /* idの入力 */
  printf("id:");
  fgets(line,sizeof(line),stdin);
  sscanf(line,"%d",&id);
  /* nameの入力 */
  printf("name:");
  fgets(name,sizeof(name),stdin);
  len=strlen(name);
  if(name[len-1]=='\n'){name[len-1]='\0';}
  /* scoreの入力 */
  printf("score:");
  fgets(line,sizeof(line),stdin);
  sscanf(line,"%lf",&score);
  /*ファイルに書き込む*/
  fprintf(fp,"%d,%s,%lf\n",id,name,score);
  /*ファイルを閉じる*/
  fclose(fp);
}
