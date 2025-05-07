import sys
from datetime import datetime

def get_res(text: str) -> str:
    lowered: str = text.lower()

    if lowered in ['hello', 'hi', 'hey']:
        return 'Hello there'
    elif 'how are you' in lowered:
        return "I'm fine, thank you"
    elif 'your name' in lowered:
        return 'My name is Bot :)'
    elif 'time' in lowered:
        current_time: datetime = datetime.now()
        return f'The time is {current_time.strftime("%H:%M")}'
    elif lowered in ['goodbye', 'bye']:
        return 'Goodbye'
    else:
        return "Sorry, I didn't understand you"

# This should be outside the function
while True:
    user_input: str = input('You: ')
    if user_input == 'exit':
        print('Bot: It was a pleasure to meet you!')
        sys.exit()

    bot_res: str = get_res(user_input)
    print(f'Bot: {bot_res}')
