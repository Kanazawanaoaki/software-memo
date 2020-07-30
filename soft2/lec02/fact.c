#include <stdio.h>
#include <stdlib.h>

int fact (int x) {
  if (x >= 0) {
#ifdef DEBUG
    printf("x = %d\n", x);
#endif
    return (x * fact (x-1));
  } else {
#ifdef DEBUG
    printf("x = %d, return 1\n",x);
#endif
    return 1;
  }
}

int main(int argc, char *argv[]) {
  int x, ret;
  x = atoi(argv[1]);
  ret = fact(x);
  printf("ret = %d\n", ret);
}
