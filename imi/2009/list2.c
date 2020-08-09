void func2(int from, int to) {
  int middle = (from+to)/2;
  if(to-from == 1) return;
  func2(from,middle);
  func2(middle,to);
  merge(from,middle,to);
}
void sort2() {
  func2(0, N);
}
