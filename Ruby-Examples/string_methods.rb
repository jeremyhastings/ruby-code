# .length

puts "Jeremy".length

# .reverse

puts "Jeremy".reverse

# .upcase & .downcase

puts "Jeremy".upcase
puts "Jeremy".downcase

puts

# .capitalize

name = "jeremy"
puts name
puts name.capitalize
puts name
puts name.capitalize! # Permanently changes variable.
puts name

# thith_meanth_war

there_is_s = false
unless there_is_s
  print "Please enter your input: "
  user_input = gets.chomp
  user_input.downcase!

  if user_input.include? "s"
    user_input.gsub!(/s/, "th")
    puts user_input
    there_is_s = true
  end
end

