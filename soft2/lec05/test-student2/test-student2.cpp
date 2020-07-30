#include <stdio.h>
#include <string.h>
#include "labmember.h"
#include "student2.h"
#include "professor2.h"

int main (int argc, char **argv) {
  Professor p1("yamada");
  Student s1("suzuki");

  p1.SetRoom(123);
  s1.SetGrade(4);

  printf("professor name = %s (%d) \n", p1.GetName(), p1.GetRoom());
  printf("student name   = %s (%d) \n", s1.GetName(), s1.GetGrade());

  return 0;
}
