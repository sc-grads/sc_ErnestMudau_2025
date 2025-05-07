import time

# Uncommenting this would cause infinite recursion
# def func() -> None:
#     print('Recursion')
#     func()

# func()

def connect_to_internet(signal: bool, delay: int) -> None:
    if delay > 5:
        signal = True

    if signal:
        print('Connected!')
    else:
        print(f'Connection failed. Try again in: {delay}s...')
        time.sleep(delay)
        connect_to_internet(signal, delay + 2)

# Start the function call
connect_to_internet(False, 0)
