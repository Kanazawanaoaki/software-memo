/* sample_newton.c */
#include <stdio.h>
#include <math.h>

#define EPS pow(10.0,-8.0) /* epsilonの設定 */
#define NMAX 10 /* 最大反復数 */

void newton(double x); /* Newton法 */
double f(double x); /* f(x)の計算 */
double df(double x); /* f'(x)の計算 */

int main(void)
{
  double x;
  char buf[40];
  printf("初期値x0: \n");
  fgets(buf, sizeof(buf), stdin);
  sscanf(buf, "%lf", &x);

  newton(x);

  return 0;
}

/* Newton法 */
void newton(double x)
{
  int n=0; double d;

  do{
    d = -f(x)/df(x);
    x = x + d;
    n ++;
  } while(fabs(d) > EPS && n < NMAX);

  if (n == NMAX){
    printf("答えが見つかりません\n");
  } else {
    printf("答え: x=%15.8e\n",x);
  }
}

double f(double x){
  return (pow(x,5.0)-5.0*pow(x,3.0)+4.0*x);
}

double df(double x){
  return (5.0*pow(x,4.0)-15.0*pow(x,2.0)+4.0);
}
