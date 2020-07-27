#include <stdio.h>

class test_class{
  // 非公開メンバ
  int a;
public:
  int b;
  void set_a(int num){
    this->a = num;
  }
  int get_a(void){
    return this->a;
  }
};

int main(void)
{
  test_class test;

  test.set_a(1); // test.a = 1
  test.b = 2;

  printf("a = %d\n", test.get_a());
  printf("b = %d\n", test.b);

  return 0;
}
