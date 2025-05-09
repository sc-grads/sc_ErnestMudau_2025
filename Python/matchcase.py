while True:
    user_input: str = input('Enter a command: ')
    command: list[str] = user_input.split()

    match command:
        case ['find', *images]:
            print(f'Finding: {images}...')
        case ['enlarge', image, amount]:
            print(f'You enlarged {image} by {amount}x')
        case ['rename', image, new_name] if len(new_name) > 3:
            print(f'"{image}" was renamed to "{new_name}"')
        case ['download', *images]:
            print(f'Downloading: {images}...')
        case ['x' | 'delete', *images]:
            print(f'Deleting: {images}...')
        case _:
            print('Command not found...')