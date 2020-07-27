#include <stdio.h>

struct student_data{
  char name[100];
  int score;
};

typedef struct student_data student_data_t;

void student_data_output(student_data_t *data)
{
  printf("Score of %s : %d\n", data->name, data->score);
}

int main(void)
{
  student_data_t student1 = {"Todai Hanako", 80};

  student_data_output(&student1);

  return 0;
}
