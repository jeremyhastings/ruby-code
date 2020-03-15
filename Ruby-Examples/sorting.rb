# SORTING

my_array = [3, 4, 8, 7, 1, 6, 5, 9, 2]

# Call the sort! method on my_array below.
# my_array should then equal [1, 2, 3, 4, 5, 6, 7, 8, 9].

my_array.sort!

print my_array

# library sorting code
books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# How might we sort! the books in alphabetical order? (Hint, hint)

print books.sort!

# COMBINED COMPARISON OPERATOR

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

book_1 <=> book_2

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

# Sort your books in descending order, in-place below

books.sort! { |secondBook, firstBook| firstBook <=> secondBook }

# ALPHABETIZE
def alphabetize(arr, rev=false)
  arr.sort!
  if rev
    return arr.reverse!
  else
    return arr
  end
end

numbers = [76,323,54,12,22,98,75]
puts
books = ["Oliver Twist", "Alice in Wonderland", "The Two Towers", "The Hobbit", "Fellowship of the Ring"]

puts alphabetize(books, true)
