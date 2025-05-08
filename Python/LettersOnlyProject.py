import string

def is_letters_only(text : str) -> None:
    alphabet: str = string.ascii_letters + ''

    for char in text:
        if char not in alphabet:
            raise ValueError('text can only contain letters from alphabet!')

        print(f'"{text}" is letters_only, good job')

def main() -> None:
    while True:
        try:
            user_input: str = input('check text: ')
            is_letters_only(user_input)
        except ValueError:
            print('please only enter letters...')
        except Exception as  e:
            print(f'encountered and unknown exception :{type(e)} {e}')

main()