#include<stdio.h>

int main(void)
{
  double v1[3], v2[3], v3[3]; //3次元ベクトルの宣言

  v1[0]=1; v1[1]=2; v1[2]=4; //ベクトルの要素を入力
  v2[0]=0; v2[1]=-2; v2[2]=2;

  v3[0] = v1[0] + v2[0]; //ベクトルの足し算
  v3[1] = v1[1] + v2[1];
  v3[2] = v2[2] + v2[2];

  printf("%lf + %lf = %lf \n", v1[0], v2[0], v3[0]); //結果の出力
  printf("%lf + %lf = %lf \n", v1[1], v2[1], v3[1]);
  printf("%lf + %lf = %lf \n", v1[2], v2[2], v3[2]);

  return 0;
}
