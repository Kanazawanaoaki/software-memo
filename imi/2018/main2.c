#include <stdio.h>
#include <stdlib.h>
#include "element.h"

int main() {
  ELEM e1, e2, e3, *ep;
  e1.v = '9';
  e2.v = '8';
  e3.v = '+';
  e1.p = &e2;
  e2.p = &e3;
  e3.p = NULL;
  for (ep = &e1; ep != NULL; ep = ep->p) {
    printf("%c ", ep->v);
  }
  printf("\n");
  return 0;
}
