/* test-template.cpp */
#include <stdio.h>

template <class T> T MAX(T x, T y, T z) {
  T temp1 ;
  temp1 = x > y ? x : y;
  temp1 = temp1 > z ? temp1 : z;
  return temp1;
}

int main () {
  int a = 10, b = 8, c = 6;
  double d = 10.0, e = 8.0, f = 6.0;

  int m = MAX(a,b,c);
  double n = MAX(d,e,f);
  printf("%d %f\n", m, n);
}
