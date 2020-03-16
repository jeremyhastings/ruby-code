sentence = "Welcome to the jungle"
first_name = "Jeremy"
last_name = "Hastings"
full_name = first_name + " " + last_name
# String concatenation
puts first_name + " " + last_name
# String interpolation
puts "My first name is #{first_name} and my last name is #{last_name}."
# String interpolation only works with double quotes not with single quotes
puts 'My first name is #{first_name} and my last name is #{last_name}.'
# Methods & Common Methods
puts full_name
# puts full_name.class
# puts full_name.methods
puts full_name.length
puts full_name.reverse
puts full_name.capitalize
puts full_name.empty?
puts full_name.nil?
puts sentence
sentence.sub("the jungle", "utopia")
puts sentence
sentence.sub!("the jungle", "utopia") # Exclamation rewrites
puts sentence
puts 'Jeremy asked \'Hey Jeremy, how are you doing?\'' # Back Slash escapes
puts "\#{first_name}"