/* test-student4.cpp */
#include <stdio.h>
#include <string.h>
#include "labmember4.h"
#include "student4.h"
#include "professor4.h"
#include "lab4.h"

int main (int argc, char **argv) {
  Lab jsk;
  Professor *p1 = new Professor();
  Student *s1 = new Student();

  p1->SetName("yamada");
  s1->SetName("suzuki");
  p1->SetRoom(123);
  s1->SetGrade(4);
  jsk.AddMember(p1);
  jsk.AddMember(s1);

  jsk.PrintMember();

  delete p1;
  delete s1;
  return 0;
}
