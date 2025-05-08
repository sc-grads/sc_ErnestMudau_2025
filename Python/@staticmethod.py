def add(*numbers: float) -> float:
    return sum(numbers)

class Calculator:
    def __init__(self, version: int) -> None:
        self.version = version

    @staticmethod
    def add(*numbers: float) -> float:
        return sum(numbers)

    def get_version(self) -> int:
        return self.version

def main() -> None:
    calc: Calculator = Calculator(version=1)
    result: float = calc.add(1.5, 2.3, 3.7)
    print(f"Result: {result}")
    print(f"Calculator version: {calc.get_version()}")

if __name__ == '__main__':
    main()