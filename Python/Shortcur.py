def get_stats(name: str) -> None:
    print(f"{name} is a great name!")
    print(f"It has {len(name)} characters.")
    print(f"In uppercase, that's {name.upper()}.")


get_stats("James")
