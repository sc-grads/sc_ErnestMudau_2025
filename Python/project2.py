import random
import sys

#step1 : starting info
print(' Welcom to RSP ')
moves: dict = {'rock': '🪨','scissors':'✂','paper':'📰'}
valid_moves: list[str] = list(moves.keys())

#step 2: infinite loop

while True:
    user_move: str = input( 'rock, paper, or scissors? >> ' ).lower()

    if user_move == 'exit':
        print('Thanks for playing')
        sys.exit()

    if user_move not in valid_moves:
       print('invalid move...')
       continue

    #AI Decides
    ai_move: str = random.choice(valid_moves)
    print('----')
    print(f'You: {moves[user_move]}')
    print(f'AI: {moves[ai_move]}')
    print('----')

    #check moves
    if user_move == ai_move:
        print('its a tie!')
    elif user_move == 'rock' and ai_move == 'scissors':
        print('you win')
    elif user_move == 'scissors' and ai_move == 'paper':
        print('you win')
    elif user_move == 'rock' and ai_move == 'scissors':
        print('you win')
    elif user_move == 'paper' and ai_move == 'rock':
        print('you win')
    else:
        print('AI wins...')