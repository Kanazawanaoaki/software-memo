#include <stdio.h>

class test_class{
  int a;
public:
  int b;
  test_class(int val_a, int val_b){ // コンストラクタ
    this->a = val_a;
    this->b = val_b;
  }
  ~test_class(){ // デストラクタ
    // 必要な終了処理はここに書く
    printf("Done. \n");
  }
  void set_a(int num){
    this->a = num;
  }
  int get_a(void){
    return this->a;
  }
};

int main(void)
{
  test_class *test;
  test = new test_class(-5,30);

  printf("a = %d \n", test->get_a());
  printf("b = %d \n", test->b);

  delete test;

  return 0;
}
