#include "student.h"
#include <string.h>

Student::Student(const char* _name){
  strcpy(name, _name);
  grade = 0;
}
Student::~Student(){
}
void Student::SetGrade(int _grade){
  grade = _grade;
}
int Student::GetGrade(){
  return grade;
}
char* Student::GetName(){
  return name;
}
