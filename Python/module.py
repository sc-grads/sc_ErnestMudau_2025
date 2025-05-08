#single file containing python code
#
#eg "mport time"

from typing import Final

AUTHOR: Final[str] = 'federico'
VERSION: Final[int] = 1

def greet(name: str) -> None:
    print(f'Hello, {name}')