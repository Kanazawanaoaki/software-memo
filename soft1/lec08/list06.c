#include<stdio.h>
#include<string.h>

int main(void)
{
  char trg_string[100], src_string[100];

  printf("please input a target string \n"); //連結先と連結する文字列の入力
  scanf("%s",trg_string);
  printf("please input a source string \n");
  scanf("%s",src_string);

  strcat(trg_string, src_string); //2つの文字列を連結する
  puts(trg_string); //連結した文字列を表示

  return 0;
}
