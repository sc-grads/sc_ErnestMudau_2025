class Animal:
    def __init__(self, name: str) -> None:
        self.name = name

    def drink(self) -> None:
        print(f'{self.name} is drinking.')

    def eat(self) -> None:
        print(f'{self.name} is eating.')

        class Dog(Animal):
            def __init__(self, name: str) -> None:
                class Dog(Animal):
                    def __init__(self, name: str) -> None:
                        super().__init__(name)

                    def bark(self) -> None:
                        print(f'{self.name}: bark bark!')

                    def routine(self) -> None:
                        self.eat()  # Inherited from Animal
                        self.bark()
                        self.drink()