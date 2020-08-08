#include "queue.h"
#define N 7

int tree_search(int adj[N][N], int s, int g)
{
  int j, count = 0;
  add_queue(s);
  while ( head->next != NULL ) {
    printf("%d: ", count++);
    print_queue();
    int element = remove_queue();
    if (element == g) { return 1; }
    for (j=1; j<N;j++)
      if (adj[element][j] == 1)
	add_queue(j);
  }
  return 0;
}

int main() {
  static int adj[N][N] =
    {{0, 1, 1, 0, 0, 0, 0},
     {0, 0, 0, 1, 0, 0, 0},
     {0, 0, 0, 0, 1, 1, 0},
     {0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 1},
     {0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0}};
  head = (queue_t *)malloc(sizeof(queue_t));
  head->item = -1;
  head->next = NULL;
  tree_search(adj, 0, 6);
  return 0;
}
