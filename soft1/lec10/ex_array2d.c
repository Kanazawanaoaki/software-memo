/* 2次元配列を引数として渡す(ex_array2d.c) */
#include<stdio.h>

void func(int (*arr)[3]){
  int i,j;
  for(i=0;i<2;i++){
    for(j=0;j<3;j++){
      printf("%d,",arr[i][j]);
    }
    putchar('\n');
  }
}

int main(void){
  int arr2d[][3] = {{1,2,3},{4,5,6},};
  func(arr2d);
  return 0;
}
