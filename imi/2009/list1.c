void func1(int size) {
  int i;
  for (i=1; i<size; i++) {
    if(data[i-1]>data[i])swap(i-1,i);
  }
}
