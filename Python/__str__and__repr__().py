class Person:
    def __init__(self, name: str, age: int) -> None:
        self.name = name
        self.age = age

    def __str__(self) -> str:
        return f'{self.name}: {self.age} years old'

def main() -> None:
    manio: Person = Person('Manio', 27)
    print(manio)

if __name__ == '__main__':
    main()