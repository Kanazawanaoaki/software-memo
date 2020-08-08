#include <stdio.h>
#include <stdlib.h>

typedef struct queue{
  int item;
  struct queue *next;
} queue_t;

queue_t *head;

void add_queue(int element) {
  queue_t *t = head;
  while (t->next != NULL) t = t->next;
  queue_t *q = (queue_t *)malloc(sizeof(queue_t));
  q->item = element;
  q->next = NULL;
  t->next = q;
}

int remove_queue() {
  int element;
  queue_t *q = head->next;
  head->next = q->next;
  element = q->next;
  free(q);
  return element;
}

void print_queue() {
  queue_t *q = head->next;
  while (q != NULL) {
    printf("%d ", q->item);
    q = q->next;
  }
  printf("\n");
}
