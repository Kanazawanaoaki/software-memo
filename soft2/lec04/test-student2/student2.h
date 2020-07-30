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

  void SetGrade(int _grade) {
    grade = _grade;
  }

  int GetGrade() {
    return grade;
  }
};
