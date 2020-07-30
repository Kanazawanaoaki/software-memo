/* test-reference.cpp */

#include <stdio.h>

void test1 (int a) { a = 1;}
void test2 (int* a) { *a = 2; }
void test3 (int& a) { a = 3; }

main () {
  int n = 0;
  test1(n);
  printf("%d\n", n);
  test2(&n);
  printf("%d\n", n);
  test3(n);
  printf("%d\n", n);
}
