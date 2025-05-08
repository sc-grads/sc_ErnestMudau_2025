var: int


def func() -> None:
    var = "Hello"  # You need to define 'var' before using it
    print(var)

    def func2() -> None:
        inner_var = 1
        print(var)  # Can access 'var' from outer function

        def func3() -> None:
            print(inner_var)  # Can access 'inner_var' from func2

    func2()  # You need to actually call the inner functions


func()  # Call the main function