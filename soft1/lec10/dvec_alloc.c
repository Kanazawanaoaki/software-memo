/* 1次元配列の動的メモリ割付(dvec_alloc.c) */
#include <stdio.h>
#include <stdlib.h>

double *dvector(int n); /* ベクトル領域の確保 */

int main(void){
  char buf[40];
  int i,num;
  double *vec1;

  printf("# of vector size: ");
  fgets(buf,sizeof(buf),stdin);
  sscanf(buf,"%d",&num);

  printf("vec1 allocation\n");
  vec1 = dvector(num); /* 領域確保 */
  for (i=0;i<num;i++){
    vec1[i]=(double)i;
    printf("vec1[%d]=%f \n", i,vec1[i]);
  }
  free(vec1);
  return 0;
}

double *dvector(int n)
{
  double *vec=malloc(n*sizeof(double));
  if(vec==NULL){
    printf("Failure!! (from devector) \n");
    exit(1);
  }
  return (vec);
}
