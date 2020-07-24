#include <stdio.h>

int add(int x,int y){
  return x+y;
}
int add(int x, int y, int z){
  return x+y+z;
}
int main(){
  printf("%d\n",add(1,2));
  printf("%d\n",add(1,2,3));
}
