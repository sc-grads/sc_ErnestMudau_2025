people: list[str] = [ 'Ronewa' , 'James' , 'Happy']

print(people[0])
print(people[2])

print('---------------------------')


print('Original:',people)
print('---------------------------')
people.append('doku')

people.remove('Happy')
print('people:',people)

print('---------------------------')
people[0] = 'Ernest'
print(people)