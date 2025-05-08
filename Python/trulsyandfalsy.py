#data: dict = {} #its falsy because its empty

users: dict = {1: 'Manio', 2: 'Luigi', 3: 'happy'}

if users:
    for k, v in users.items():
        print(k, v, sep=': ')
else:
    print('No data found...')
#if it like this it will return falsy
    userss: dict = {}

    if userss:
        for k, v in userss.items():
            print(k, v, sep=': ')
    else:
        print('No data found...')