# Iterate through a hash

secret_identities = {
    "The Batman" => "Bruce Wayne",
    "Superman" => "Clark Kent",
    "Wonder Woman" => "Diana Prince",
    "Freakazoid" => "Dexter Douglas"
}

secret_identities.each { | secret, identity | puts "#{secret}: #{identity}" }

# Histogram

print "Please enter your input: "
text = gets.chomp
words = text.split(" ")
frequencies = Hash.new(0)
words.each { | word | frequencies[word] += 1 }
frequencies = frequencies.sort_by { | word, count | count }
frequencies.reverse!
frequencies.each { | word, count | puts word + " " + count.to_s }




