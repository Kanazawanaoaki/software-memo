#include <stdio.h>
#include <stdlib.h>

int *read_array(char *fname, int *num, int *len);
void print_array(int num[], int length);
void selection_sort(int *num, int length);

int main(int argc, char *argv[])
{
  int length, *num;
  char *fname = "rand.txt";

  printf("reading from %s\n", fname);
  num = read_array(fname, num, &length);

  print_array(num, length);
  selection_sort(num, length);
  print_array(num, length);

  free(num);
  return (0);
}

void selection_sort(int *num, int length)
{
  int i, n, tmp;
  int min, min_pos;
  for(i=0;i<length-1;i++){
    print_array(num, length);

    min = num[i]; //仮の最小値の値
    min_pos = i; //仮の最小値の場所
    for(n=i+1;n<length;n++){
      if(num[n] < min) {
	// 比較対象の数字が仮の最小値より小さければ，仮の最小値をそれにする
	min = num[n];
	min_pos = n;
      }
    }
    tmp = num[i]; //最小値と最初の数を入れ替え
    num[i] = min;
    num[min_pos] = tmp;

  }
}
