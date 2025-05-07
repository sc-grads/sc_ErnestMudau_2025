def func(var_a: str, /, var_b: str) -> None:
    print(var_a)
    print(var_b)

func('a', 'b')
