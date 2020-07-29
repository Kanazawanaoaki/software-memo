# class Professor:
#     name = None
#     room = 0

#     def __init__(self, name):
#         self.name = name

#     def set_room(self,room):
#         self.room = room

#     def get_room(self):
#         return self.room

#     def get_name(self):
#         return self.name

class LabMember:
    name = None

    def __init__(self, name):
        self.name = name

    def get_name(self):
        return self.name

class Student(LabMember):
    grade = 0

    def __init__(self, name):
        LabMember.__init__(self, name)

    def set_grade(self, grade):
        self.grade = grade

    def get_grade(self):
        return self.grade
    
class Professor(LabMember):
    room = 0
    def __init__(self, *args, **kwargs):
        LabMember.__init__(self, *args, **kwargs)

    def set_room(self,room):
        self.room = room

    def get_room(self):
        return self.room

p1 = Professor("yamada")
s1 = Student("suzuki")

p1.set_room(123)
s1.set_grade(4)

print("professor name = %s (%d)"%(p1.get_name(), p1.get_room()))
print("student name = %s (%d)"%(s1.get_name(), s1.get_grade()))
