names: list[str] = ['Mario', 'James', 'Luigi', 'John']
j_names: list[str] = []


for name in names:
    if name.startswith('J'):
        j_names.append(name)

# List comprehension
j_names_lc: list[str] = [name
                        for name in names
                        if name.startswith('J')]

print(j_names_lc)  # Output: ['James', 'John']