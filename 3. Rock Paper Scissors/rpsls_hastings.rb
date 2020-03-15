############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Rock Paper Scissors
#  Date:         October 13th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Design and implement an application that plays the Infamous Zero Triangle Null the Destroyer's
#  Unfriendly Game of Rock, Paper, Scissors, Lizard, Spock.
#
############################################################


play_game = "z"

# Laydown a variable to keep my while loop open until the user quits
user_input = 0

# Statistical variables
records_table = {
    "Wins: " => 0,
    "Losses: " => 0,
    "Ties: " => 0
}

# Establish Selection Array
selection_array = ["Rock","Scissors","Lizard","Paper","Spock"]

# Establish Mad Lib Insult Arrays

noun_insult_array = ["human","monkey","curr","gorrilla","quadraped","mouth breather","mammal","bag of protoplasm",
                     "knuckle dragger","parasite","wookie","baboon","rabble","peasant","insect","filth","reptile","nothing"]
insulting_noun = rand(0..(noun_insult_array.count - 1))

adjective_good_array = ["awesome","unfriendly","masterful","mind-destroying","soul-crushing","magnificent",]
adjective_insult_array = ["tiny","small","infinitesimally small","microscopic","filthy","unispiring"]
insulting_invalid_array = [
    "Are you incapable of following directions?", "Is it too hard to reach the keys with your vestigial arms?",
    "Did you think there was a secret option or something?","I knew you couldn't read.",
    "You might be better off hitting that Red Square in the top right corner, I know I would be.",
    "When everyone is special, no one is.  I rest easy knowing we have you.",
    "Everything good happened before you were born."]
insulting_departure_array = [
    "I would say come again but I didn't want you to play in the first place.",
    "You are, and always have been, the weakest link.", "Buh-Bye #{noun_insult_array.at(insulting_noun)}",
    "It's because of people you like you Lucas made Ewoks.",
    "There is a small town in Arizona named after you.  You should move there.",
    "I'm sure if you had your DNA tested you'd find that you are part #{noun_insult_array.at(insulting_noun)}.",
    "Good Riddance.", "I'm less having known you."]
winning_insult_array = [
    "Wow, your parents must be proud.","That purple ribbon is almost yours.",
    "Occasionally, I like to dangle hope in front of you.", "You're still a #{noun_insult_array.at(insulting_noun)}.",
    "Given an infinite amount of time your efforts will still end in failure.",
    "Anyone ever say that they hate your face?  Because if I had access to the webcam, I'm sure I would."]
tying_insult_array = [
    "Have you ever tried to have an original thought?","The goal is to win, you know?",
    "I think I'm more self aware than you.", "I would say copying others is beneath you but its not.",
    "You are embarrasing."]
loser_array = [
    "Your tears are delicious, I want to collect them in a chalice.",
    "Don't blame yourself, blame your parents.  They did stop helicoptering, right?",
    "You have been weighed and measured, and found wanting.","You lack capacity and I enjoy exploiting it.",
    "Your father was a hamster and your mother reeked of elderberries.",
    "The only thing I find worse than you is Star Trek V.",
    "I don't care how you feel, television has made you worse in everyway possible."]

# Introduce, explain game
insulting_noun = rand(0..(noun_insult_array.count - 1))
adjective = rand(0..(adjective_good_array.count - 1))
adjective_insult = rand(0..(adjective_insult_array.count - 1))

print "\n\n\n"
puts "Hello #{noun_insult_array.at(insulting_noun)}, welcome to Null the Destroyer's #{adjective_good_array.at(adjective)} game of Rock, Paper, Scissors, Lizard, Spock"
puts
puts "Quite simple really, even a #{adjective_insult_array.at(adjective_insult)} mind like yours should comprehend."
puts "Scissors cuts Paper, Paper covers Rock, Rock crushes Lizard"
puts "Lizard poisons Spock, Spock smashes Scissors, Scissors decapitates Lizard"
puts "Lizard eats Paper, Paper disproves Spock, Spock vaporizes Rock"
puts "and Rock crushes Scissors."
puts

while play_game != "n"
  puts
  print "Would you like to play a game (Y/N)? "
  play_game = gets.chomp.downcase

  while play_game == "y"

# While Loop until the user quits
    while (user_input != (selection_array.count + 1))

      # Display Menu
      puts
      selection_array.each_with_index do | value, index |
        puts "#{index + 1}. #{value}"
      end
      puts "#{selection_array.count + 1}. Quit."
      puts

      # Ask for selection
      insulting_noun = rand(0..(noun_insult_array.count - 1))

      # puts "Currently you have #{wins} win(s), #{losses} loss(es), and #{ties} tie(s)."

      puts "Your Current Record is:"
      puts
      records_table.each do | records, table |
        puts "#{records}#{table}"
      end
      puts
      print "Would you like to play again, #{noun_insult_array.at(insulting_noun)}?  Make a selection: "
      user_input = gets.to_i

      # Computer makes selection
      computer_selection = rand(0..(selection_array.count - 1))

      # Run user selection through conditionals
      # Invalid selection
      if ((user_input > (selection_array.count + 1)) || (user_input < 1))
        question_insult = rand(0..(insulting_invalid_array.count - 1))
        insulting_noun = rand(0..(noun_insult_array.count - 1))

        puts
        puts "#{insulting_invalid_array.at(question_insult)}  Enter a valid selection #{noun_insult_array.at(insulting_noun)}."

        # User Quits
      elsif (user_input == (selection_array.count + 1))
        departure_insult = rand(0..(insulting_departure_array.count - 1))
        puts
        records_table.each do | records, table |
          puts "#{records}#{table}"
          play_game = "n"
        end
        puts "#{insulting_departure_array.at(departure_insult)}"
        # Game Conditionals
      else
        user_input = user_input - 1
        if (((user_input + 1) == computer_selection) || ((user_input + 2) == computer_selection))
          winning_insult = rand(0..(winning_insult_array.count - 1))
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "#{winning_insult_array.at(winning_insult)}  You've Not Lost."
          records_table["Wins: "] += 1
        elsif ((user_input) == computer_selection)
          tying_insult = rand(0..(tying_insult_array.count - 1))
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "#{tying_insult_array.at(tying_insult)}  Try not to pick the same as me next time."
          records_table["Ties: "] += 1
        elsif (((user_input + 1) == selection_array.count) && ((computer_selection == 0) || ((computer_selection == 1))))
          winning_insult = rand(0..(winning_insult_array.count - 1))
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "#{winning_insult_array.at(winning_insult)}  You've Not Lost."
          records_table["Wins: "] += 1
        elsif (((user_input + 2) == selection_array.count) && (computer_selection == 0))
          winning_insult = rand(0..(winning_insult_array.count - 1))
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "#{winning_insult_array.at(winning_insult)}  You've Not Lost."
          records_table["Wins: "] += 1
        else
          loser_insult = rand(0..(loser_array.count - 1))
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "#{loser_array.at(loser_insult)}  The victory is mine!"
          puts
          records_table["Losses: "] +=1
        end
      end
    end
  end
end

