numbers = [1,3,5]
double = []

for num in numbers:
    double.append(num * 2)
    
    print(double)
 


friends = ["Rolf", "Sam", "Samantha", "Saurabh", "Jen"]
starts_s = []

for friend in friends:
    if friend.startswith("S"):
        starts_s.append(friend)

print(starts_s)
#same as above
friends = ["Sam", "Samantha", "Saurabh"]
starts_s = [friend for friend in friends if friend.startswith("S")]

print(friends)
print(starts_s)
print(friends is starts_s)