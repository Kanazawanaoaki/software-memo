int divide(int num) {
  int count = 0;
  int i = num;
  while (i > 0) {
    i /= 4;
    count++;
  }
  return count;
}
