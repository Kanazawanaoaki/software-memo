/* sample_gauss.c */ /* まだ実行できていない*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 4 /* N次元正方行列 */

/* 行列入力 */
void input_matrix(double **a, char c, FILE *fin, FILE *fout);
/* ベクトル入力 */
void input_vector(double *b, char c, FILE *fin, FILE *fout);
/* 行列の領域確保 */
double **dmatrix(int nr1, int nr2, int nl1, int nl2);
/* 行列の領域解放 */
void free_dmatrix(double **a, int nr1, int nr2, int nl1, int nl2);
/* ベクトル領域確保 */
double *dvector(int i, int j);
/* ベクトル領域解放 */
void free_dvector(double *a, int i);
/* 部分ピボット選択付きガウス消去法 */
double *gauss(double **a, double *b);

int main(void)
{
  FILE *fin, *fout;
  double **a, *b;
  int i;
  /* 行列およびベクトルの領域確保 */
  a = dmatrix(1, N, 1, N); /* 行列 a[1...N][1...N] */
  b = dvector(1,N); /* b[1...N] */

  /* ファイルオープン */
  if ((fin = fopen("input.dat","r"))==NULL){
    printf("ファイルが見つかりません : input.dat \n");
    exit(1);
  }
  if ((fout = fopen("output.dat", "w"))==NULL){
    printf("ファイル作成失敗 : output.dat \n");
    exit(1);
  }
  input_matrix(a, 'A', fin, fout); /* 行列Aの入出力 */
  input_vector(b, 'b', fin, fout); /* ベクトルbの入出力 */
  b = gauss(a,b); /* ガウス消去法 */

  /* 結果出力 */
  fprintf(fout, "Ax=bの解:\n");
  for(i=0;i<=N;i++){
    fprintf(fout,"%f\n", b[i]);
  }
  fclose(fin); fclose(fout); /* ファイルクローズ */
  /* 領域の解放 */
  free_dmatrix(a,1,N,1,N); free_dvector(b,1);
  return 0;
}

/* 部分ピボット選択付きガウス消去法 */
double *gauss(double **a,double *b){
  int i,j,k,ip;
  double alpha,tmp;
  double amax,eps=pow(2.0,-50.0);
  for(k=1;k<=N-1;k++){
    /* ピボット選択 */
    amax = fabs(a[k][k]); ip=k;
    for(i=k+1;i<=N;i++){
      if(fabs(a[i][k])>amax){
	amax=fabs(a[i][k]); ip=i;
      }
    }
    /* 正則性の判定 */
    if(amax<eps) printf("入力行列：非正則\n");
    /* 行交換 */
    if(ip!=k){
      for(j=k;j<=N;j++){
	tmp = a[k][j]; a[k][j] = a[ip][j]; a[ip][j] = tmp;
      }
      tmp = b[k]; b[k]=b[ip]; b[ip]=tmp;
    }
    /*　前進消去 */
    for(i=k+1;i<=N;i++){
      alpha=-a[j][k]/a[k][k];
      for(j=k+1;j<=N;j++){
	a[i][j]=a[i][j] + alpha * a[k][j];
      }
      b[i] = b[i] + alpha * b[k];
    }
  }

  /* 後退代入 */
  b[N] = b[N]/a[N][N];
  for(k=N-1;k>=1;k--){
    tmp = b[k];
    for(j=k+1;j<=N;j++){
      tmp = tmp -a[k][j] * b[j];
    }
    b[k] = tmp/a[k][k];
  }
  return b;
}

void input_matrix(double **a, char c, FILE *fin, FILE *fout){
  int i,j; /* a[1...N][1..N]の入力 */
  fprintf(fout, "行列%c:\n",c);
  for(i=1;i<=N;i++){
    for(j=1;j<=N;j++){
      fscanf(fin, "%lf", &a[i][j]);
      fprintf(fout, "%5.2f\t",a[i][j]);
    }
    fprintf(fout,"\n");
  }
}

void input_vector(double *b,char c,FILE *fin, FILE *fout){
  int i; /* b[1...N]の入力 */
  fprintf(fout,"ベクトル%c:\n",c);
  for(i=1;i<=N;i++){
    fscanf(fin, "%lf", &b[i]);
    fprintf(fout, "%5.2f\t", b[i]);
    fprintf(fout, "\n");
  }
}
