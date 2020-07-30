/* student3.h */

class Student : public LabMember {
 private:
  int grade;

 public:
  Student(const char* _name)
    : LabMember(_name) {
    grade = 0;
  }
  ~Student() {
  }

  char* SetName(char* _name){
    sprintf(name, "Mr. %s", _name);
  }
  void SetGrade(int _grade) {
    grade = _grade;
  }
  int GetGrade() {
    return grade;
  }
};
