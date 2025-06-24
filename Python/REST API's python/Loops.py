number = 7
user_input = input(" would like to play: (Y/n)").lower()

while True :
    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif number - user_number in (1, -1):
        print("You were off by one.")
    else:
        print("Sorry, it's wrong!")
        
        user_input = input("Would uou like to play again ? (Y/n)")
        
        
        friends = ["happy","newie","ernest"]
        
        for friend in range(4):
            print("f{friend} is my friend")
              
            
grades = [35,65,98,100,100]
total = 0
amount = len(grades)

for grade in grades:
    total += grade
    
print(total / amount)