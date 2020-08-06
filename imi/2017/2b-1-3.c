typedef int (*func) (int, int);
int add(int x, int y) { return x + y; }
int mul(int x, int y) { return x * y; }
int apply(func f, int x, int y) { return f(x, y);}

int main (){
  
  printf( " add = %d \n", apply(add, 1, 3));
  printf( " mul = %d \n", apply(mul, 1, 3));

  return 0;
}

