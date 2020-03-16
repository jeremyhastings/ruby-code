puts "Simple Calculator"
25.times { print "-" }
puts
print "Enter the first number: "
num_1 = gets.chomp.to_i
print "Enter the second number: "
num_2 = gets.chomp.to_i
puts "The first number multiplied by the second number is #{num_1 * num_2}"
puts "The first number divided by the second number is #{num_1 / num_2}"
puts "The first number plus the second number is #{num_1 + num_2}"
puts "The first number minus the second number is #{num_1 - num_2}"
puts "The remainder of the first number divided by the second number is #{num_1 % num_2}"