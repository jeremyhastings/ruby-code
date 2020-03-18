dial_book = {
    "newyork" => "212",
    "newbrunswick" => "732",
    "edison" => "908",
    "plainsboro" => "609",
    "sanfrancisco" => "301",
    "miami" => "305",
    "paloalto" => "650",
    "evanston" => "847",
    "orlando" => "407",
    "lancaster" => "717"
}

continue = true
# Get city names from the hash
def get_city_names(somehash)
  # somehash.each { | city_name, area_code | puts city_name }
  somehash.keys
end

# Get area code based on given hash and key
def get_area_code(somehash, key)
  # area_code = somehash[key]
  # area_code
  somehash[key]
end

# Execution flow
while continue == true
  puts
  print "Do you want to lookup an area code based on a city name? (Y/N) "
  lookup = gets.chomp.downcase
  continue = false if lookup != "y"
  if continue == true
    puts
    puts "Which city do you want the area code for?"
    puts
    puts get_city_names(dial_book)
    puts
    print "Enter your selection: "
    city = gets.chomp.downcase
    if dial_book.include?(city)
      # area_code = get_area_code(dial_book, city)
      puts "The area code for #{city} is #{get_area_code(dial_book, city)}"
    else
      puts "You entered an invalid city name."
    end
  end
end
