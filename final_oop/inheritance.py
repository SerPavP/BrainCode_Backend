
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def introduce(self):
        return f"Hello, my name is {self.name} and I am {self.age} years old."

class Teacher(Person):
    def __init__(self, name, age, subject):
        super().__init__(name, age)
        self.subject = subject
    
    def introduce(self):
        return super().introduce() + f" I teach {self.subject}."
    
    def teach(self):
        return f"Teacher {self.name} is teaching {self.subject}."

class Student(Person):
    def __init__(self, name, age, grade):
        super().__init__(name, age)
        self.grade = grade
    
    def introduce(self):
        return super().introduce() + f" I am in grade {self.grade}."
    
    def study(self):
        return f"Student {self.name} is studying."

teacher = Teacher("Alice", 30, "Mathematics")
student = Student("Bob", 16, "10th grade")

print(teacher.introduce())
print(teacher.teach())

print(student.introduce())
print(student.study())
