import sys

total: int = 0
while True:
    user_input: str =input('enter a number')

    if user_input == '0':
        print('total: ', total)
        sys.exit()

    total += int(user_input)