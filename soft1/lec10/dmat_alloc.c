/* 2次元配列の動的メモリ割付(dmat_alloc.c) */
#include <stdio.h>
#include <stdlib.h>

double **dmatrix(int,int); /* 行列領域の確保 */

int main(void){
  char buf[40];
  int nrow,ncol; /* 行数,列数 */
  int i,j;
  double **matrix1; /* ポインタへのポインタ */

  printf("# of rows: ");
  fgets(buf, sizeof(buf),stdin);
  sscanf(buf,"%d",&nrow);
  printf("# of columns: ");
  fgets(buf, sizeof(buf),stdin);
  sscanf(buf,"%d",&ncol);

  printf("matrix1 allocation \n");
  matrix1 = dmatrix(nrow,ncol); /* 領域確保 */
  for(i=0;i<nrow;i++) /* (i,j)要素にi+jを代入 */
    for(j=0;j<ncol;j++)
      matrix1[i][j] = (double)(i+j);
  for(i=0;i<nrow;i++) /* 全成分の表示 */
    for(j=0;j<ncol;j++)
      printf("matrix1[%d][%d] = %f \n",i,j,matrix1[i][j]);
  free(matrix1);
  return 0;
}

double **dmatrix(int nr,int nc){
  double **mat;
  mat = malloc(nr*sizeof(double *));
  if(mat == NULL)
    puts("Failure!! (from (*dmatrix)[nr])");
  else {
    int i,j;
    double *base = malloc(nr*nc*sizeof(double));
    if(base == NULL)
      puts("Failure!!(from dmatrix[nr][nc])");
    else {
      for(i=0;i<nr;i++)
	mat[i] = base + i*nc;
    }
    free(base);
  }
  return (mat);
}
