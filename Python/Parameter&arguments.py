def greet(name: str):     #this is a parameter
    print(f'hello, {name}!')

greet('Ronest')
greet('Ernest')
greet('happy') #but here its an argument "happy"

def greeting(name: str, language: str, default: str):
    if language == 'it':
        print(f'ciao, {name}')
    else:

        print(f'{default}, {name}')

greeting('ernest', 'it', 'hello')