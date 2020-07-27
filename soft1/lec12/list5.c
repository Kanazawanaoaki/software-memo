#include <stdio.h>
#include <stdlib.h>

// n次元ベクトルの構造体
typedef struct{
  int size;
  double *value;
} vector_t;

// n次元ベクトルの初期化(動的メモリ確保)
void vector_init(vector_t *vector, int n)
{
  vector->size = n;
  vector->value = (double *)calloc(n,sizeof(double));
}

// n次元ベクトルの終了処理
void vector_exit(vector_t *vector)
{
  free(vector->value);
}

// ベクトルのi番目の要素の設定
void vector_set_element(vector_t *vector, int i, double val)
{
  vector->value[i] = val;
}

// ベクトルの表示
void vector_output(vector_t *vector)
{
  int i;

  printf( "[" );
  for(i=0;i<vector->size;i++){
    printf("%lf ",vector->value[i]);
  }
  printf("]\n");
}

int main(void)
{
  vector_t vector;

  vector_init(&vector,2); // 2次元ベクトルとして初期化

  // ベクトルの各要素の値を設定
  vector_set_element(&vector,0,1.0);
  vector_set_element(&vector,1,2.0);

  // ベクトルの値の表示
  vector_output(&vector);

  vector_exit(&vector);

  return 0;
} 
