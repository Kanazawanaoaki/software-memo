void func3(int from, int to) {
  int i, m;
  if(from >= to-1) return;
  m = from;
  for (i=from+1;i<to;i++)
    if(data[i] < data[from])
      swap(++m,i);
  swap(from,m);
  dump();
  func3(from,m);
  func3(m+1, to);
}
void sort3() {
  func3(0, N);
}
