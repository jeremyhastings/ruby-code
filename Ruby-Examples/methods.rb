# METHODS

def array_of_10
  puts (1..10).to_a
end

array_of_10

# ARGUMENTS

def cubertino(n)
  puts n ** 3
end

cubertino(8)

# SPLAT ARGUMENTS

def what_up(greeting, *friends)
  friends.each { |friend| puts "#{greeting}, #{friend}!" }
end

what_up("What up", "Ian", "Zoe", "Zenas", "Eleanor")

# RETURN

def add(num1, num2)
  return num1+num2
end

puts add(3, 5)

# BLOCKS

1.times do
  puts "I'm a code block!"
end

1.times { puts "As am I!" }

# method that capitalizes a word
def capitalize(string)
  puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} # prints "Ryan", then "Jane"

# The block, {|i| puts i}, is passed the current
# array item each time it is evaluated. This block
# prints the item.
[1, 2, 3, 4, 5].each { |i| puts i }

# This block prints the number 5 for each item.
# (It chooses to ignore the passed item, which is allowed.)
[1, 2, 3, 4, 5].each { |i| puts i*5 }

