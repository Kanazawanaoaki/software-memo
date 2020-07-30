/* professor4.h */

class Professor : public LabMember {
 private:
  int room;

 public:
 Professor() : LabMember() {}
 Professor(char* _name)
   : LabMember(_name){
    room = 0;
  }
  ~Professor() {
  }
  
  char* SetName(char* _name){
    sprintf(name, "Prof. %s", _name);
  }
  void SetRoom(int _room) {
    room = _room;
  }
  int GetRoom() {
    return room;
  }
  void PrintInfo () {
    printf("professort name = %s, room = %d\n", GetName(), GetRoom());
  }
};
