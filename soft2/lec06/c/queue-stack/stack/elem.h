class Elem{
 public:
  int state; // can be used as an index
  Elem * nextptr; // previous or next node

  Elem(int s, Elem * p){ // normal constructor
    state = s;
    nextptr = p;
  }
  ~Elem(){} // destructor

  Elem* next(){ // return a pointer to the next
    return nextptr;
  }
  void setnext(Elem *p){ // set next
    nextptr = p;
  }
};
