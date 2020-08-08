#include "queue.h"
#define N 7

int tree_search(int adj[N][N], int s, int g)
{
  int j; printf("%d ", s);

  
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
