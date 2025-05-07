def get_length(text: str) -> int:
    print(f'Getting the length of : "{text}"...')
    return len(text)

name: str = 'marioweetry'
length: int = get_length(name)
print(length)


def make_upper(text: str) -> str:
    return text.upper()

print(make_upper('yebo'))