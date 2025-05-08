user_input: str = 'abc'

try:
    result: float = 1 / float(user_input)
    print(f'1 / {user_input} = {result}')
except ValueError:
    print(f'You cannot use: "{user_input}" as a value.')
except ZeroDivisionError:
    print('Don\'t be silly, you cannot divide by 0.')
else:
    print('adfnm')
finally:
    print('im always excecuted')
