############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Word Search
#  Date:         June 4th, 2019
#  Class:        CIS 283 - PROGRAMMING PRINCIPLES II
#  Description:  Read some words, make a crossword, pretend
#                it was difficult? :D
#
############################################################

# Make the puzzle class  & prawn available to my word search program
require "./puzzle.rb"
require 'prawn'

# Open words.text file into puzzle_file
puzzle_file = File.open("words.txt")

# Call my_puzzle as a new Puzzle class
my_puzzle = Puzzle.new()

# Run through each line of the file and add it to the puzzle_words array in the my_puzzle object
until puzzle_file.eof?
  puzzle_string = puzzle_file.gets.chomp.split(/\n/)
  my_puzzle.add_word(puzzle_string)
end

# Close the file
puzzle_file.close

# Generate PDF
Prawn::Document.generate("puzzle.pdf") do |pdf|

  # initialise Puzzle grid
  my_puzzle.init_grid

  # insert words into puzzle grid
  my_puzzle.build_grid

  # create answer key based off current puzzle grid
  ANSWER_KEY = my_puzzle.to_s

  # finish puzzle McGuire style
  my_puzzle.you_complete_me_grid

  # BORING PRAWN STUFF BELOW
  pdf.font "Courier", :size => 11
  pdf.text "\nPuzzle\n\n"
  pdf.text_box my_puzzle.to_s, :at => [0, 675],
               :height => 400,
               :width => 700,
               :character_spacing => 5.4
  pdf.text_box "\nList of Words to Find:\n\n", :at => [0, 275],
               :height => 25,
               :width => 700
  pdf.column_box([0, 225], :columns => 4, :width => 700) do
    pdf.text((<<-END) * 1)
      #{my_puzzle.list_of_words}
    END
  end

  pdf.start_new_page

  pdf.font "Courier", :size => 11
  pdf.text "\nAnswer Key\n\n"
  pdf.text_box ANSWER_KEY, :at => [0, 675],
               :height => 400,
               :width => 700,
               :character_spacing => 5.4
  pdf.text_box "\nList of Words to Find:\n\n", :at => [0, 275],
               :height => 25,
               :width => 700
  pdf.column_box([0, 225], :columns => 4, :width => 700) do
    pdf.text((<<-END) * 1)
      #{my_puzzle.list_of_words}
    END
  end
end
