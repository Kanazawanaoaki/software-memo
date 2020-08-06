#include <stdio.h>
#include <stdlib.h>

float absolute(float x) {
  return (x < 0)?(-x):(x);
}

int good_enough(float (*func)(float), float guess) {
  return (absolute((*func)(guess)) < 0.0001);
}

float improve(float (*func)(float), float (*func_)(float), float guess) {
  if ( (*func_)(guess) == 0.0 ) exit(1);
  return /* blank a */;
}

float my_solve(float (*func)(float), float (*func_)(float), float guess) {
  while (!good_enough(func, guess)) {
    printf("%.2f\n", guess);
    guess = improve(func, func_, guess);
  }
  return guess;
}

float f(float x) {
  return (x*x -2);
}

float f_(float x) {
  return /* blank b */;
}

int main() {
  float a = my_solve(f, f_, 1.0);
  printf("%.2f\n", a);
  return 0;
}
