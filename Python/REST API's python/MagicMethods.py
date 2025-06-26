#__str__ and __repr__

class Person:
    def _init_(self, name, age):
        self.name = name
        self.age = age

    # def _str(self):def __str_(self):
    #     return f"Person {self.name}, {self.age} years old."

    def _repr_(self):
        return f"<Person('{self.name}', {self.age})>"

bob = Person("Bob", 35)
print(bob)