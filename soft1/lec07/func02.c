#include <stdio.h>

void just_display(void){
  printf("software!!\n");
  return;
}

int main(void)
{
  printf("Call the function \n");

  just_display();

  printf("Finished!\n");

  return 0;
}
