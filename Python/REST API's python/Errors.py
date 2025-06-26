def divide(dividend, divisor):
    if divisor == 0:
        raise ZeroDivisionError("Cannot divide by zero")
    return dividend / divisor

students = [
    {"name": "Bob", "grades": [75, 90]},
    {"name": "Rolf", "grades": []},
    {"name": "Jen", "grades": [100, 90]},
]

for student in students:
    try:
        name = student["name"]
        grades = student["grades"]
        average = divide(sum(grades), len(grades))
        print(f"{name} averaged {average}.")
    except ZeroDivisionError:
        print(f"ERROR: {name} has no grades!")

print("-- End of student average calculation --")