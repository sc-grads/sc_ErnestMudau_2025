a,c = [5,6]

print (a, c) # this will print 5 and 6 respectively

b, * d, e= 'qwertyu'

print(b,d,e)  # d will have everything in the middle

*_, last = 'asdfghj'
print(_)

def add(f: int,g: int) -> None:
    print(f'{a+b= }')

    numbers: dict[str, int] = {'f':5,'b':10}
    add(**numbers)

    add()