#include <stdio.h>
#include <stdlib.h>

int *read_array(char *fname, int *num, int *len);
void print_array(int num[], int length);
void bubble_sort(int *num, int length);

int main(int argc, char *argv[])
{
  int c,length, *num;
  char *fname = "rand.txt";

  enum {SELECTION, SELECTION2, BUBBLE, HEAP, MERGE, QUICK}
  sort_algorithm = SELECTION;
  char *sort_algorithm_str[] = {"SELECTION", "SELECTION2", "BUBBLE", "HEAP", "MERGE", "QUICK"};

  while ((c = getopt(argc, argv, "f:s2bhmq")) != -1) {
    switch (c) {
    case 'f':
      fname = optarg; break;
    case 's':
      sort_algorithm = SELECTION; break;
    case '2':
      sort_algorithm = SELECTION2; break;
    case 'b':
      sort_algorithm = BUBBLE; break;
    case 'h':
      sort_algorithm = HEAP; break;
    case 'm':
      sort_algorithm = MERGE; break;
    case 'q':
      sort_algorithm = QUICK; break;
    }
  }
  fprintf(stderr, "reading from %s\n", fname);
  num = read_array(fname, num, &length);
  print_array(num, length);

  fprintf(stderr, "using %s algorithm\n", sort_algorithm_str[sort_algorithm]);

  switch(sort_algorithm){
  case SELECTION:
    selection_sort(num, length);
    break;
  case SELECTION2:
    selection_sort2(num, 0, length-1);
    break;
  case BUBBLE:
    bubble_sort(num, length);
    break;
  case HEAP:
    heap_sort(num, lenght);
    break;
  case MERGE:
    merge_sort(num, 0, length-1);
    break;
  case QUICK:
    quick_sort(num, 0, length-1);
    break;
  }
  print_array(num, length);
  free(num);
  return (0);
}

 
void bubble_sort(int *num, int length)
{
  int i, n, tmp;
  for(i=0;i<length;i++){
    for(n=length - 1;n>i;n--){
      if(num[n] < num[n-1]){//比較対象の数字が一つ前の数字より小さければ入れ替える．
	tmp = num[n];
	num[n] = num[n-1];
	num[n-1] = tmp;
      }
    }
  }
}
