############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Rock Paper Scissors
#  Date:         October 13th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Design and implement an application that plays the rock-scissors-paper game against the computer.
#
############################################################

play_game = "z"


# Introduce, explain game
print "\n\n\n"
puts "Hello human, welcome to Null's friendly game of Rock, Paper, Scissors"
puts
puts "Quite simple really,"
puts "Rock beats Scissors"
puts "Scissors beats Paper"
puts "and Paper beats Rock"
puts

while play_game != "n"
  puts
  print "Would you like to play a game (Y/N)? "
  play_game = gets.chomp.downcase

  while play_game == "y"

    # Laydown a variable to keep my while loop open until the user quitsn
    user_input = 0

    # Statistical variables
    wins = 0
    losses = 0
    ties = 0

    # Establish Selection Array
    selection_array = ["Rock", "Scissors", "Paper"]

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
      puts "Currently you have #{wins} win(s), #{losses} loss(es), and #{ties} tie(s)."
      puts
      print "Would you like to play?  Please make a selection: "
      user_input = gets.to_i

      # Computer makes selection
      computer_selection = rand (0..(selection_array.count - 1))

      # Run user selection through conditionals
      # Invalid selection
      if ((user_input > (selection_array.count + 1)) || (user_input < 1))
        puts
        puts "Please enter a valid selection."
        puts
      # User Quits
      elsif (user_input == (selection_array.count + 1))
        puts
        puts "You had #{wins} win(s), #{losses} loss(es), and #{ties} tie(s)."
        puts "Please come again."
        puts
        play_game = "n"
      # Game Conditionals
      else
        user_input = user_input - 1
        if ((user_input + 1) == computer_selection)
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "You Win"
          puts
          wins += 1
        elsif ((user_input) == computer_selection)
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "We tie."
          puts
          ties += 1
        elsif (((user_input + 1) == selection_array.count) && (computer_selection == 0))
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "You Win"
          puts
          wins += 1
        else
          puts "You select #{selection_array.at(user_input)}"
          puts "I select #{selection_array.at(computer_selection)}"
          puts "You Lose"
          puts
          losses += 1
        end
      end
    end
  end
end
