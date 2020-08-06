#include <stdio.h>
void heap_add(int *num, int length, int c) {
  int p, tmp;
  if (c <= 0 || c >= length) return;
  while(1) {
    p = (c-1)/2;
    if (p < 0)
      break;
    if (num[p] <= num[c])
      break;
    tmp=num[p];num[p]=num[c];num[c]=tmp;
    c = p;
  }
}

void heap_del_loop (int *num, int length, int p) {
  int c, tmp;
  while (1) {
    c = p*2 + 1; /* blank a */
    if (c >= length)
      break;
    if (c+1 < length && /* blank b */ num[c+1] <= num[c])
      c = c+1; /* blank c */
    if (num[p] <= num[c]) /* blank d */
      break;
    tmp=num[p];num[p]=num[c];num[c]=tmp;
    p = c; /* blank e */
  }
}

void heap_del (int *num, int length) {
  int p = 0, tmp;
  tmp = num[p]; num[p]=num[length];num[length]=tmp;
  heap_del_loop(num, length, p);
}

int main () {
  int num[10] = {2,3,0,9,4,7,8,1,6,5};
  int length = 10, i;
  for (i = 0; i < length; i++) printf("%d ", num[i]); printf("\n");
  for (i = 0; i < length; i++) heap_add(num, length, i);
  for (i = 0; i < length; i++) printf("%d ", num[i]); printf("\n");
  while (--length >= 0) {
    printf("%d ", num[0]);
    heap_del(num, length);
  }
  printf("\n");
  return 0;
}
