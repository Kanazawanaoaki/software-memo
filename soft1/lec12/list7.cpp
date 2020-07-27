#include <stdio.h>

class test_class{
  // 非公開メンバ
  int a;
 public:
  // 公開メンバ
  int b;
};

int main(void)
{
  test_class test;

  test.a = 1; // 非公開メンバaにアクセス
  test.b = 2;

  printf("a = %d\n", test.a); // 非公開メンバaにアクセス
  printf("b = %d\n", test.b);

  return 0;
}
