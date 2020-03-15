# SYMBOLS

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

symbols = []
strings.each { | string | symbols.push(string.to_sym) }
print symbols

# SELECT

movie_ratings = {
    memento: 3,
    primer: 3.5,
    the_matrix: 5,
    truman_show: 4,
    red_dawn: 1.5,
    skyfall: 4,
    alex_cross: 2,
    uhf: 1,
    lion_king: 3.5
}

puts
good_movies = movie_ratings.select { | movie, grade | grade > 3 }
other_movies = movie_ratings.select { | k, v | k == :truman_show }

puts good_movies
puts other_movies

# each_key, each_value
movie_ratings = {
    memento: 3,
    primer: 3.5,
    the_matrix: 3,
    truman_show: 4,
    red_dawn: 1.5,
    skyfall: 4,
    alex_cross: 2,
    uhf: 1,
    lion_king: 3.5
}

movie_ratings.each_key { | k | puts k }
movie_ratings.each_value { | v | print v, " "}

# A Night at the Movies

movies = { :"Infinity Wars" => 5,
}
quit = false
while quit != true
  puts "What is your choice? "
  choice = gets.chomp

  case choice
  when "add"
    puts "What is the title of the movie? "
    title = gets.chomp
    title = title.to_sym
    puts "What is the rating of the movie? "
    rating = gets.chomp.to_i
    if movies[title] == nil
      movies[title] = rating
      puts "Movie and Rating Added!"
    else
      puts "That movie already exists!"
    end
  when "update"
    puts "What movie do you want to update? "
    title = gets.chomp
    title = title.to_sym
    if movies[title] == nil
      puts "That movie doesn't exist."
    else
      puts "What do you want to change the rating to? "
      rating = gets.chomp.to_i
      movies[title] = rating
    end
  when "display"
    movies.each { | movie, rating | puts "#{movie}: #{rating}" }
  when "delete"
    puts "What movie do you want to delete? "
    title = gets.chomp
    title = title.to_sym
    if movies[title] == nil
      puts "That movie doesn't exist."
    else
      movies.delete(title)
    end
  when "quit"
    quit = true
  else
    puts "Error!"
  end
end

