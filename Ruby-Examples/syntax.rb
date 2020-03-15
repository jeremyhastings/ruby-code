
# Data Types: Numbers, Strings, Booleans

my_num = 25
my_boolean = true
my_string = "Ruby"

puts my_num
puts my_boolean
puts my_string

# Puts and Print
puts "Hello, How are you?"
print "Won't you tell me your name?"

# Get Input

print "What's your first name? "
first_name = gets.chomp.capitalize! # ! makes permanent change to variable.

print "What's your last name? "
last_name = gets.chomp.capitalize! # ! makes permanent change to variable.

print "What city are you from? "
city = gets.chomp.capitalize! # ! makes permanent change to variable.

print "What state are you from? "
state = gets.chomp.upcase! # ! makes permanent change to variable.

print "Your name is #{first_name} #{last_name} from #{city}, #{state}"

# Control Flow (If/elsif/else)

print "Integer please: "
user_num = Integer(gets.chomp)

if user_num < 0
  puts "You picked a negative integer!"
elsif user_num > 0
  puts "You picked a positive integer!"
else
  puts "You picked zero!"
end

# Control Flow (Until)

hungry = false

unless hungry
  puts "I'm writing Ruby programs!"
else
  puts "Time to eat!"
end

