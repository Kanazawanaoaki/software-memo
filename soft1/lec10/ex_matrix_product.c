/* 2つの行列の積を計算(ex_matrix_product.c) */
#include<stdio.h>

int main(void){
  int i,j,k;
  int a[2][3] = {{0,1,2},{3,4,5}};
  int b[3][2] = {0,1,2,3,4,5,};
  int c[2][2] = {0};

  for(i=0;i<2;i++)
    for(j=0;j<2;j++)
      for(k=0;k<3;k++)
	c[i][j] += a[i][k] * b[k][j];

  for(i=0;i<2;i++)
    for(j=0;j<2;j++)
      printf("c[%d][%d] = %d\n", i,j,c[i][j]);

  return 0;
}
