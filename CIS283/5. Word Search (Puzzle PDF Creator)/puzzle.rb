############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Word Search
#  Date:         June 4th, 2019
#  Class:        CIS 283 - PROGRAMMING PRINCIPLES II
#  Description:  Read some words, make a crossword, pretend
#  it was difficult? :D
#
############################################################

class Puzzle

  attr_reader :puzzle_grid, :puzzle_words

  def initialize
    @puzzle_words = []
    @puzzle_grid = []
  end

  # Add word to word list
  def add_word(word)
    @puzzle_words.push(word)
  end

  # Add Letter to Grid
  def add_letter(x, y, letter)
    if(letter == " ")
      letter = "."
    end
    @puzzle_grid[x][y] = letter
  end

  # Make a 45 x 45 grid
  def init_grid
    45.times do
      puzzle_row = []
      45.times do
        puzzle_row.push('.')
      end
      @puzzle_grid.push(puzzle_row)
    end
  end

  # Insert Words into puzzle grid
  def build_grid
    i = 0
    # How many words are there?
    puzzle_length = self.puzzle_words.length
    while i < puzzle_length
      # Call a random direction which is returned as a string but turn it into an array at the ,
      direction = self.random_direction.split(',').to_a

      # Make index 0 one direction, 1 the other
      x_direction = direction[0].to_i
      y_direction = direction[1].to_i

      # Call a random grid coordinate ... same as above
      placement = self.random_placement.split(',').to_a
      x_placement = placement[0].to_i
      y_placement = placement[1].to_i

      # Make it a string
      word_to_test = self.puzzle_words[i].join

      # Make sure that the placement is a legal placement
      possible_placement = self.error_check_placement_direction(x_direction, y_direction, x_placement, y_placement, word_to_test)
      if(possible_placement)
        # If it is a legal placement, make sure there is nothing in the way
        all_clear = self.error_check_path(x_direction, y_direction, x_placement, y_placement, word_to_test)
        if(all_clear)
          # since it is legal, lay down them letters
          word_to_place = word_to_test.upcase.split(//)
          j = 0
          while j < word_to_place.length
            x_d = x_direction * j
            y_d = y_direction * j
            self.add_letter(x_placement + x_d, y_placement + y_d, word_to_place[j])
            j += 1
          end
          i += 1
        end
      end
    end
  end

  # Finish the puzzle off
  def you_complete_me_grid
    counter_x = 0
    while counter_x < 45
      counter_y = 0
      while counter_y < 45
        # while the grid coordinate is a .
        while(self.puzzle_grid[counter_x][counter_y] == '.')
          # pick a random word from the list of words
          random_word = rand(0..self.puzzle_words.length - 1)
          word_for_letter = self.puzzle_words[random_word].join
          # pick a random letter
          random_letter = rand(0..word_for_letter.length - 1)
          letter_for_grid = word_for_letter[random_letter].upcase
          # add letter to the grid
          self.add_letter(counter_x, counter_y, letter_for_grid)
        end
        counter_y += 1
      end
      counter_x += 1
    end
  end

  # Direction Y'ALL!
  def random_direction

    direction = rand(1..8)
    case direction

    when 1
      return "0,1"
    when 2
      return "0,-1"
    when 3
      return "1,0"
    when 4
      return "-1,0"
    when 5
      return "1,1"
    when 6
      return "-1,1"
    when 7
      return "1,-1"
    when 8
      return "-1,-1"
    end
  end

  # Coordinates Y'ALL!
  def random_placement

    x = rand(0..44)
    y = rand(0..44)

    return x.to_s + ',' + y.to_s
  end

  # Check them digits
  def error_check_placement_direction(x_d, y_d, x_p, y_p, word)
    # based off the coordinates, the direction coordinates, and the word length
    # take base coordinates and add (direction coordinates * word length)
    # if it is outside the board it is not a legal placement

    if((x_p + (x_d * word.length) > 44) || (x_p + (x_d * word.length) < 0))
      return false
    elsif((y_p + (y_d * word.length) > 44) || (y_p + (y_d * word.length) < 0))
      return false
    else
      return true
    end
  end

  # Check them digits
  def error_check_path(x_d, y_d, x_p, y_p, word)
    # Using the same theory as above, test to see if there are any letters in the way
    counter = 0
    while counter < word.length
      x_movement = x_d * counter
      y_movement = y_d * counter
      if(@puzzle_grid[(x_p + x_movement)][y_p + y_movement] != ".")
        return false
      end
      counter += 1
    end
    return true
  end

  def to_s
    grid = ""
    i = 0
    while i < self.puzzle_grid.length
      grid += @puzzle_grid[i].join + "\n"
      i += 1
    end
    return grid
  end

  def list_of_words
    words = ""
    i = 0
    while i < self.puzzle_words.length
      word_to_add = @puzzle_words[i].join
      words +=  word_to_add + "\n"
      i += 1
    end
    return words
  end

end