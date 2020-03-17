
# if /else
if true
  # execute some code
else
  # execute some other code
end

condition = false
another_condition = false

if !condition || !another_condition
  puts "This evaluated to true"
else
  puts "This evaluated to false"
end

puts "La La La"

name = "Jeremy"
if name == "Jeremy"
  puts "Welcome to the program, Jeremy"
elsif name == "Jack"
  puts "Welcome to the program, Jack"
else
  puts "Welcomt tothe program, user"
end

puts "What do you want to do?"
print "Enter 1 for multiply, 2 for addition, 3 for subtraction, 4 for division, and 5 for modulus: "
user_entry = gets.chomp

puts "You selected #{user_entry}"