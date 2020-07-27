#include <stdio.h>
#include <string.h>

// 親クラス
class Vehicle {
public:
  double miles;
  char make[32];
  char model[32];
  // コンストラクタ
  Vehicle(double miles, const char *make, const char *model){
    this->miles = miles;
    strcpy(this->make, make);
    strcpy(this->model, model);
  }
  // 価格を返す関数
  double price(){
    return 5000;
  }
};

// 子クラス
class Car : public Vehicle {
public:
  Car(double miles, const char *make, const char *model)
    : Vehicle(miles, make, model){ }
  // price関数のオーバーライド
  double price() { return 8000 - 0.1 * miles;}
};

// 子クラス
class Truck : public Vehicle {
public:
  Truck(double miles, const char *make, const char *model)
    : Vehicle(miles, make, model){ }
  // price関数のオーバーライド
  double price() { return 10000 - 0.1 * miles;}
};

int main(void)
{
  Car accord = Car(0, "Honda", "Acord");
  Truck giga = Truck(0, "Isuzu", "Giga");

  printf("%s %s %f\n", accord.make, accord.model, accord.price());
  printf("%s %s %f\n", giga.make, giga.model, giga.price());

  return 0;
}
