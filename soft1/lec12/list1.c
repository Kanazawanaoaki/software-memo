#include <stdio.h>
#include <string.h>

struct student_data{
  char name[100];
  int score;
};

int main(void)
{
  struct student_data student1;

  strcpy( student1.name, "Todai Hanako");
  student1.score = 80;

  printf("Student name: %s\n", student1.name);
  printf("Student score: %d\n", student1.score);

  return 0;
}
