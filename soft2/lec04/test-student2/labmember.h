class LabMember {
 private:
  char name[32];

 public:
  LabMember(const char* _name) {
    strcpy(name, _name);
  }
  ~LabMember(){
  }
  char* GetName() {
    return name;
  }
};
