#include <stdio.h>

struct student_data{
  char name[100];
  int score;
};

// student_data構造体のメンバ変数を表示する関数
void student_data_output(struct student_data *data)
{
  printf("Score of %s : %d\n", data->name, data->score);
}

int main(void)
{
  struct student_data student1 = {"Todai Hanako", 80};

  student_data_output( &student1 );

  return 0;
}
