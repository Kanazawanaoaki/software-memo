/* 2個の整数値を降順にソート(ex8_sort.c) */

#include <stdio.h>

void swap(int *,int *);
void sort2(int *,int *);

int main(void)
{
  int a,b;
  char buf[40];

  puts("Input 2 integers.");
  printf("Integer A ---> ");
  fgets(buf, sizeof(buf), stdin);
  sscanf(buf, "%d", &a);
  printf("Integer B ---> ");
  fgets(buf, sizeof(buf), stdin);
  sscanf(buf, "%d", &b);

  sort2(&a, &b); /* a>= b となるようソート */

  puts("Sorted in descending order!!");
  printf("Value of A: %d\n", a);
  printf("Value of B: %d\n", b);

  return 0;
}

/* --- *aと*bの値を交換 ---*/
void swap(int *a, int *b)
{
  int temp= *a;
  *a = *b;
  *b = temp;
}

/* *n1>=*n2となるようソート ---*/
void sort2(int *n1, int *n2)
{
  if(*n1 < *n2)
    swap(n1,n2); /* *n1の値と*n2の値を交換 */
}
