#include <stdlib.h>
#include "element.h"
ELEM *root_a = NULL;

int empty_s () {
  return (root_s == NULL);
}

void push(char x) {
  ELEM *e;
  e = (ELEM *)malloc(sizeof(ELEM));
  if (e != NULL) {
    e->v=x;
    /* blank a */
    root_s=e;
  }
}

char pop() {
  char r = 0;
  if (!empty_s()){
    ELEM *e;
    e=root_s;
    r=root_s->v;
    /* blank b */
    free(e);
  }
  return r;
}
