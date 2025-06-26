student = {"name": "Ernest","grades":(89,90,93,78,90)}

def avarage(sequence):
    return sum(sequence) /len(sequence)

print(avarage(student["grades"]))

class Student:
    def _init_(self, name, grades):
        self.name = name
        self.grades = grades

    def average_grade(self):
        return sum(self.grades) / len(self.grades)

student = Student("Bob", (100, 100, 93, 78, 90))
student = Student("Bob", (100, 100, 93, 78, 90))
print(student.name)
print(student.average_grade())