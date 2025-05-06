numbers = [3, 5, 7, 9]

for num in numbers:
    if num % 2 == 0:
        print(f'Even number found: {num}')
        break
else:
    print('No even numbers found.')
