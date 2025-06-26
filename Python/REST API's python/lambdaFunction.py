print(lambda x, y: x+ y)


def double(x):
    return x * 2

sequence = (1,2,3,4,5)
doubled = [double(x) for x in sequence]

doubled = map (double, sequence)
