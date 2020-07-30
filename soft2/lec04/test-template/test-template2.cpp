/* test-template2.cpp */
#include <iostream>

template <class T> class Square {
public:
  T data;
  Square (T _data) { data = _data * _data; }
  ~Square () {};
};

main () {
  Square<int> a(10);
  Square<double> b(10.1);

  std::cerr << a.data << std::endl;
  std::cerr << b.data << std::endl;  
}
