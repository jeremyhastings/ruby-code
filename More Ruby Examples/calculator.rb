def multiply(first_num, second_num)
  first_num.to_f * second_num.to_f
end
def divide(first_num, second_num)
  first_num.to_f / second_num.to_f
end
def add(first_num, second_num)
  first_num.to_f + second_num.to_f
end
def subtract(first_num, second_num)
  first_num.to_f - second_num.to_f
end
def modulus(first_num, second_num)
  first_num.to_f % second_num.to_f
end
puts "Simple Calculator"
25.times { print "-" }
puts
print "Enter the first number: "
num_1 = gets.chomp.to_i
print "Enter the second number: "
num_2 = gets.chomp.to_i
puts "What do you want to do?"
print "Enter 1 for multiply, 2 for addition, 3 for subtraction, 4 for division, and 5 for modulus: "
user_entry = gets.chomp
if user_entry == "1"
  puts "The first number multiplied by the second number is #{multiply(num_1, num_2)}"
elsif user_entry == "2"
  puts "The first number plus the second number is #{add(num_1, num_2)}"
elsif user_entry == "3"
  puts "The first number minus the second number is #{subtract(num_1, num_2)}"
elsif user_entry == "4"
  puts "The first number divided by the second number is #{divide(num_1, num_2)}"
elsif user_entry == "5"
  puts "The remainder of the first number divided by the second number is #{modulus(num_1, num_2)}"
else
  puts "invalid entry"
end
