class Student {
 private:
  char name[32];
  int grade;

 public:
  Student(const char* _name);
  ~Student();
  
  void SetGrade(int _grade);
  int GetGrade();
  char* GetName();
};
