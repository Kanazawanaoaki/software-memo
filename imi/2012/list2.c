#include "queue.h"

int main() {
  head = (queue_t *)malloc(sizeof(queue_t));
  head->item = -1; head->next = NULL;
  add_queue(1); add_queue(2);
  remove_queue(); add_queue(3);
  remove_queue(); add_queue(4);
  print_queue();
  return 0;
}
