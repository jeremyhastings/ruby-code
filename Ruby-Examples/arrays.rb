# Iterating over Arrays

languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

languages.each { | language | puts language }

# Iterating Arrays within Arrays

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each { | sandwhich | sandwhich.each { | ingredient | puts ingredient }}

# REDACTED

puts "Please enter your text: "
text = gets.chomp
puts "What should be redacted? "
redact = gets.chomp

words = text.split(" ")

words.each do | word |
  if word == redact
    print "REDACTED "
  else
    print word + " "
  end
end


