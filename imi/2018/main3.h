#include <stdio.h>
#include <ctype.h>
#include "stack.h"
#include "queue.h"

int main() {
  enqueue('9');
  enqueue('8');
  enqueue('+');
  enqueue('7');
  enqueue('*');
  enqueue('6');
  enqueue('-');
  while (!empty_q()) {
    char c = dequeue();
    if ( isdigit(c) ) {
      push(c-'0');
      /* blank c */

    }


  }
  printf("%d\n", pop());
  return 0;
}
