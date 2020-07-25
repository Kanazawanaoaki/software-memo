#include<stdio.h>

int main(void)
{
  double v1[3], v2[3]; //3次元ベクトルの宣言
  double ans;

  v1[0]=1; v1[1]=2; v1[2]=4; //ベクトルの要素を入力
  v2[0]=0; v2[1]=-2; v2[2]=2;

  ans = v1[0] * v2[0] + v1[1]*v2[1] + v1[2]*v2[2];

  printf("v1*v2 = %lf \n", ans); //結果の出力

  return 0;
}

