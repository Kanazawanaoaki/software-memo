#include <stdio.h>
#include <stdlib.h>

int *read_array(char *fname, int *num, int *len);
void print_array(int num[], int length);
void merge_sort(int *num, int left, int right);
void merge(int *num, int left, int right, int size);

int main(int argc, char *argv[])
{
  int length, *num;
  char *fname = "rand.txt";

  printf("reading from %s\n", fname);
  num = read_array(fname, num, &length);

  print_array(num, length);
  merge_sort(num, 0, length -1);
  print_array(num, length);

  free(num);
  return (0);
}

void merge_sort(int *num, int left, int right)
{
  int middle;
  if (left < right) {
    middle = (right + left) / 2;
    merge_sort(num, left, middle);
    merge_sort(num, middle + 1, right);
    merge(num, left, middle + 1, right - left + 1);
  }
}

void merge(int *num, int left, int right, int size)
{
  int *tmp, h, i, j, k, l;
  tmp = malloc((left + size) * sizeof(int));
  i = left;
  j = right;
  k = left;
  l = left + size;
  while ((i < right) && (j < l)){
    if (num[i] < num[j]) {
      tmp[k] = num[i];
      i++;
    } else {
      tmp[k] = num[j];
      j++;
    }
    k++;
  }
  if (i < right) {
    for (h=i;h<right;h++) {
      tmp[k] = num[h];
      k++;
    }
  }
  if (j < l) {
    for (h=j;h<l;h++) {
      tmp[k] = num[h];
      k++;
    }
  }
  for (h=left;h<l;h++) {
    num[h] = tmp[h];
  }
  free(tmp);
}
