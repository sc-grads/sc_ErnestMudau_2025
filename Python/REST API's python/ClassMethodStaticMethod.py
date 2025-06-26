class ClassTest:
    def instance_method(self):
        print(f"Called instance_method of {self}")

    @classmethod
    def class_method(cls):
        print(f"Called class_method of {cls}")

    @staticmethod
    def static_method():
        print("Called static_method.")

ClassTest.static_method()

class Book:
    TYPES = ("hardcover", "paperback")

    def _init_(self, name, book_type, weight):
        self.name = name
        self.book_type = book_type
        self.weight = weight

    def _repr_(self):
        return f"<Book {self.name}, {self.book_type}, weighing {self.weight}g>"

    @classmethod
    def hardcover(cls, name, page_weight):
        return Book(name, Book.TYPES[0], page_weight + 100)

book = Book.hardcover("Harry Potter", 1500)
print(book)