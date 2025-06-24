Friend_ages = {"Rolf": 24, "Adam": 30, "Anne":27}
Friend_ages["Ernest"] =24
print(Friend_ages["Adam"])
print(Friend_ages)

friends = [
    {"name": "Rolf", "age": 24},
    {"name": "Adam", "age": 30},
    {"name": "Anne", "age": 27},
]

print(friends[1]["name"])

student_attendance = {"Rolf": 90, "Bob": 80, "Anne": 100}

if "Bob" in student_attendance:
    print(f"Bob: {student_attendance['Bob']}")
else:
    print("Bob is not a student in this class.")
    
student_attendance = {"Rolf": 96, "Bob": 80, "Anne": 100}
attendance_values = student_attendance.values()
print(sum(attendance_values) / len(attendance_values))