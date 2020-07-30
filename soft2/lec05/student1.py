class Student:
    name = None
    grade = 0

    def __init__(self, name):
        self.name = name

    def set_grade(self, grade):
        self.grade = grade

    def get_grade(self):
        return self.grade

    def get_name(self):
        return self.name

s1 = Student("yamada")
s2 = Student("suzuki")

s1.set_grade(1)
s2.set_grade(2)

print("studnet naem = %s (%d)"%(s1.get_name(), s1.get_grade()))
print("studnet naem = %s (%d)"%(s2.get_name(), s2.get_grade()))
