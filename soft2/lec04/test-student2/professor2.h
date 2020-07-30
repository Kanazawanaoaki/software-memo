class Professor : public LabMember {
 private:
  int room;

 public:
  Professor(const char* _name)
    : LabMember(_name){
    room = 0;
  }
  ~Professor() {
  }

  void SetRoom(int _room) {
    room = _room;
  }

  int GetRoom() {
    return room;
  }
};
