while True:
    user_input: str = input('Enter a number: ')

    try:
        number: float = float(user_input)
        print(f'You entered: {number}')
    except Exception as e:
        print('Program encountered an exception!')
        print(f'Type: {type(e)}')
        print(f'Error: {e}')