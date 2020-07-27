#include <stdio.h>

// 有理数(rational number)の計算用クラス
class Rat {
public:
  int n,d; // numerator, denominator
  Rat(int n, int d){
    this->n = n; this->d = d;
  }
  Rat operator+(const Rat& r)
  {
    return Rat(((n * r.d) + (d * r.n)), (d * r.d));
  }
};

int main(){
  Rat one_half = Rat(1,2);
  Rat one_third = Rat(1,3);
  printf("%d/%d + ", one_half.n, one_half.d);
  printf("%d/%d = ", one_third.n, one_third.d);
  Rat tmp = one_half + one_third;
  printf("%d/%d \n", tmp.n, tmp.d);
}
