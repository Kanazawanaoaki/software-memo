#include <stdio.h>
#include <stdlib.h> /* これが必要 */

int main(void){
  int *pi, n;

  n=5;
  printf("先頭アドレスpiは%p\n",pi);
  pi = (int *)malloc(sizeof(int)*n);

  if(pi != NULL){
    printf("先頭アドレスはpiは%p\n",pi);
  } else {
    printf("メモリ確保失敗\n");
  }
  free(pi); /* 使いおわったら解放. */
  return 0;
}
