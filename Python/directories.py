users: dict = {1:'Bob', 2: 'alice'}
empty: dict = {}


print(users[2])
print(users[1])
print(users)
print(empty)


print('-----------------')
weather: dict = {'time': '12:00',
                 'weather': {'morning': 'rain',
                             'evening':'more rain' }}
print(weather['time'])
print(weather['weather'])
print(weather['weather']['morning'])
