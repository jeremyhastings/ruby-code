puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Thank you, you said your name is #{first_name} #{last_name}"
puts "Enter a number to multiply by 2"
input = gets.chomp
# puts input * 2 # This is still a string
puts input.to_i * 2