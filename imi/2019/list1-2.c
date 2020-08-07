void quicksort(int a[], int left, int right) {
  int i,j,pivot;
  if (left < right) {
    i = left, j = right;
    pivot = a[(left + right)/2];
    while (1) {
      while (a[i] < pivot) i++;
      while (pivot < a[j]) j--;
      if (i >= j) break;
      swap(a,i,j);
      i++; j--;
    }
    quicksort(/* blank a */);
    quicksort(/* blank b */);
  }
}
