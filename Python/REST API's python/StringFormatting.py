name = 'Bob'
greeting = f"hello, {name}"

print(greeting)

name = "Ernest"

print(f"hello. {name}")


#Template strings with formats

name = "Happy"
greeting = "hello , {}"

with_name = greeting.format(name)

print(with_name)

#you can use it for longer phrase
longer_phrase = "hello , {}. today is {}"
formatted = longer_phrase.format("Ernest","Monday")
print(formatted)