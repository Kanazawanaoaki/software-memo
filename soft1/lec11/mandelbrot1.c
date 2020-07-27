/* マンデルブロ集合の計算 */
#include<stdio.h>
#include<math.h>

#define C0r 0.36 // 計算領域の実数軸中心座標
#define C0i 0.1 // 計算領域の虚数軸中心
#define Dxy 0.025 // 計算領域の中心位置からの距離
#define NMAX 20000 // 最大繰り返し数
#define STEP 1000.0 // 計算ステップ数

double mandelbrot(double a, double b){
  double x = 0.0;
  double y = 0.0;
  double x1,y1;
  int n;
  for(n=1;n <= NMAX;n++){
    x1 = x*x - y*y + a;
    y1 = 2.0*x*y + b;
    if(x1*x1 + y1*y1> 4.0) return log(n); // 発散判定
    x = x1;
    y = y1;
  }
  return 0;
}

int main(void){
  double a,b;
  for(a = C0r - Dxy; a < C0r + Dxy; a += 2.0 * Dxy / STEP){
    for(b = C0i - Dxy; b < C0i + Dxy; b += 2.0 * Dxy / STEP){
      printf("%1.14e %1.14e %1.14e \n",a,b,mandelbrot(a,b));
    }
    printf("\n");
  }
  return 0;
}
