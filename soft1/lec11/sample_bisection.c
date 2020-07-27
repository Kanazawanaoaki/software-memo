/* sample_bisection.c */
#include <stdio.h>
#include <math.h>

/* 2分法 */
double bisection(double a, double b, double eps);
/* 関数の定義 */
double f(double x);

int main(void)
{
  double a,b,x,h,y1,y2,eps = pow(2.0,-30.0);
  int n;
  char buf[40];

  printf("初期区間[a,b] --->a b\n");
  fgets(buf,sizeof(buf),stdin);
  sscanf(buf, "%lf %lf", &a, &b);
  printf("区間分割数n --->n\n");
  fgets(buf,sizeof(buf),stdin);
  sscanf(buf,"%d", &n);

  /* 対象区間を探索しながら2分法を適用 */
  h = (b-a)/n; y1 = f(a);
  for(x = a+h; x <= b; x += h){
    y2 = f(x);
    if(y1*y2 < 0.0){
      printf("Solution: x= %15.8e\n", bisection(x-h,x,eps));
    }
    y1 = y2;
  }
  return 0;
}

/* 2分法 */
double bisection(double a, double b, double eps)
{
  double c;
  do {
    c = (a+b)/2.0l;
    if(f(a)*f(c) < 0)
      b = c;
    else
      a = c;
  }while(fabs(b-a) >= eps);
  c = (a+b)/2.0;
  return c;
}

/* 関数の定義 */
double f(double x)
{
  return (pow(x,5.0)-5.0*pow(x,3.0)+4.0*x);
}
