text: str = 'hello'

for i in range(20):
    print(f'{i}: {text}')

people: list[str] = ['happy', 'ernest', 'princess']
for person in people:
    if len(person) > 4:
        print(f'{person} has a long name')
    else:
        print(f'{person} has a short name')
