
sample_hash = { 'a' => 1, 'b' => 2, 'c' => 3}
my_details = { 'name' => 'Jeremy', 'favcolor' => 'Purple'}
puts my_details['favcolor']
my_hash = {}
puts sample_hash['b']

another_hash = { a: 1, b: 2, c: 3 }

puts another_hash[:c]
print sample_hash.keys
puts
print sample_hash.values
puts
print another_hash.keys
puts
sample_hash.each do |key, value|
  puts "The class for key is #{key.class} and the value is #{value.class}"
end
my_details.each do |key, value|
  puts "The class for key is #{key.class} and the value is #{value.class}"
end
another_hash.each do |key, value|
  puts "The class for key is #{key.class} and the value is #{value.class}"
end
my_hash[:e] = "Jeremy"
my_hash[:c] = "Ruby"
my_hash.each {|key, value| puts "The key is #{key} and the value is #{value}"}

my_hash.select { |k, v| puts v.is_a?(String)}

my_hash.each { |k, v| my_hash.delete(k) if v.is_a?(String) }
puts my_hash