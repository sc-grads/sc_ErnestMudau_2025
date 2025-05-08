class Car:
    def __init__(self, brand: str, wheels: int) -> None:
        self.brand = brand
        self.wheels = wheels

    def turn_on(self) -> None:
        print(f'Turning on: {self.brand}')

    def turn_off(self) -> None:
        print(f'Turning off: {self.brand}')

    def drive(self, km: float) -> None:
        print(f'Driving: {self.brand} for {km}km')

    def describe(self) -> None:
        print(f'{self.brand} is a car with {self.wheels} wheels')  # Fixed 'wheels' typo

def main() -> None:
    bmw: Car = Car('BMW', 4)
    bmw.turn_on()
    bmw.drive(10)
    bmw.turn_off()
    bmw.describe()

if __name__ == '__main__':
    main()