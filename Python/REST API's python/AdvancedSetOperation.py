friends = {"Bob", "Rolf", "Anne"}
abroad = {"Bob", "Anne"}

local_friends = friends.difference(abroad)
print(local_friends)

friendstotal =local_friends.union(abroad) #union retrives all the friends in the 
print(friendstotal)

art = {"Bob", "Jen", "Rolf", "Charlie"}
science = {"Bob", "Jen", "Adam", "Anne"}
both = art.intersection(science)
print(both)