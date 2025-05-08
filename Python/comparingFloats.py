from math import isclose

a: float = 0.999
b: float = 1.0000

print(f'{a} == {b}', a==b)

print(f'{a} == {b}', isclose(a,b,abs_tol=0.002))