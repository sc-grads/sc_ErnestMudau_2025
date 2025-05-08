from typing import override

class Shape:
    def __init__(self, name: str, sides: int) -> None:
        self.name = name
        self.sides = sides

    def describe(self) -> None:
        print(f'{self.name} ({self.sides} sides)')

    def shape_method(self) -> None:
        pass

