def outer_func() -> None:
    name: str = 'Alice'  # Initialize name
    value: int = 0  # Initialize value

    def inner_func() -> None:
        nonlocal value  # Allow modification of outer value
        debug = 'Tom'  # Local variable (renamed to lowercase)
        value = 100  # Modifies outer_func's value

    inner_func()  # Call the inner function
    print(name, value)  # Prints: Alice 100


outer_func()  # Call the outer function