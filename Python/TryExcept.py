try:
    result: float = 10 / 0
    print(result)
except Exception as e:
    print(f'Error: {e}')

print('Done')


while True:
    try:
        user_input: str = input('Enter a number: ')
        print(f'10/{user_input} = {10/float(user_input)}')
    except ZeroDivisionError:
        print(' you cannot divide by 0')
    except ValueError:
        print('enter a valid number')
1