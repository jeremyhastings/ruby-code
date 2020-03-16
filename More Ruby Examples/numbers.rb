x = 4
y = 10
puts y / x # result is an integer because both variables are integers
puts y / x.to_f # one must be a float to get a float response
# puts "5" * "5" # Cannot multiply a string by a string
puts "5" * 2 # Can multiply a string by an integer
# puts 2 * "5" # Cannot multiply an integer by a string
puts "I am a Line"
puts "-" * 20
puts "I am a diff line a divider"
20.times { print "-" }
puts
20.times { puts rand(10) }
x = "5".to_i
puts x
puts x.to_f
y = "10".to_f
puts x.odd?
puts x.even?
