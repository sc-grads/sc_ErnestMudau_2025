from typing import Self

class Books:
    def __init__(self, title: str, pages: int):
        self.title = title
        self.pages = pages

    def __len__(self) -> int:
        return self.pages


    def __add__(self, other: Self) -> Self:
        combined_title: str = f"{self.title} & {other.title}"
        combined_pages: int = self.pages + other.pages
        return Books(combined_title, combined_pages)

def main() -> None:
    py_daily: Books = Books("Py Daily", 100)
    harry_potter: Books = Books("ronesty", 340)


    print(len(py_daily))
    print(py_daily.__len__())

    combined_books: Books = py_daily + harry_potter
    print(combined_books.title)
    print(combined_books.pages)

if __name__ == "__main__":
    main()