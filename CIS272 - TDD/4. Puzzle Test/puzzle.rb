
class Puzzle
  attr_reader :width, :height
  def initialize(width, height)
    @width = width
    @height = height
    self.solve
  end

  def set_puzzle(puzzle_str)
    empty_spaces_needed = (@width * @height) - 1
    empty_spaces = puzzle_str.count(" ")
    if empty_spaces_needed == empty_spaces
      puzzle_arr = puzzle_str.split
      (0...@height).each { |y|
        (0...@width).each { |x|
          @board[y][x] = puzzle_arr.shift
        }
      }
    else
      "They are not equal"
    end
  end

  def get_puzzle
    ret_str = ""
    (0...@board.length).each { |y|
      (0...@board[y].length).each { |x|
        ret_str += @board[y][x] + " "
      }
    }
    return ret_str.chop!
  end

  def move_up
    y_loc = 0
    x_loc = 0
    (0...@board.length).each { |y|
      x_placeholder = @board[y].index("_")
      if x_placeholder != nil
        x_loc = x_placeholder
        y_loc = y
      end
    }
    if y_loc != 0
      y_old = @board[y_loc - 1][x_loc]
      @board[y_loc - 1][x_loc] = "_"
      @board[y_loc][x_loc] = y_old
    end
  end

  def move_down
    y_loc = 0
    x_loc = 0
    (0...@board.length).each { |y|
      x_placeholder = @board[y].index("_")
      if x_placeholder != nil
        x_loc = x_placeholder
        y_loc = y
      end
    }
    if ((y_loc + 1) != @board.length)
      y_old = @board[y_loc + 1][x_loc]
      @board[y_loc + 1][x_loc] = "_"
      @board[y_loc][x_loc] = y_old
    end
  end

  def move_left
    y_loc = 0
    x_loc = 0
    (0...@board.length).each { |y|
      x_placeholder = @board[y].index("_")
      if x_placeholder != nil
        x_loc = x_placeholder
        y_loc = y
      end
    }
    if x_loc != 0
      x_old = @board[y_loc][x_loc - 1]
      @board[y_loc][x_loc - 1] = "_"
      @board[y_loc][x_loc] = x_old
    end
  end

  def move_right
    y_loc = 0
    x_loc = 0
    (0...@board.length).each { |y|
      x_placeholder = @board[y].index("_")
      if x_placeholder != nil
        x_loc = x_placeholder
        y_loc = y
      end
    }
    if ((x_loc + 1) != @board.length)
      x_old = @board[y_loc][x_loc + 1]
      @board[y_loc][x_loc + 1] = "_"
      @board[y_loc][x_loc] = x_old
    end
  end

  def solve
    @board = Array.new(@height) {Array.new(@width)}
    (0...@height).each { |y|
      (0...@width).each { |x|
        start_point = y * @width
        @board[y][x] = (start_point + x + 1).to_s
      }
    }
    @board[@height - 1][@width - 1] = "_"
  end

  def scramble
    x_length = @board[0].length
    y_length = @board.length
    counter = 0
    while counter < (x_length * y_length)
      swap_one_arr = [rand(x_length), rand(y_length)]
      swap_two_arr = [rand(x_length), rand(y_length)]
      swap_one = @board[swap_one_arr[0]][swap_one_arr[1]]
      swap_two = @board[swap_two_arr[0]][swap_two_arr[1]]
      @board[swap_one_arr[0]][swap_one_arr[1]] = swap_two
      @board[swap_two_arr[0]][swap_two_arr[1]] = swap_one
      counter += 1
    end
  end

  def to_s
    ret_str = ""
    (0...@board.length).each { |y|
      (0...@board[y].length).each { |x|
        ret_str += @board[y][x] + " "
      }
      ret_str.chop!
      ret_str += "\n"
    }
    return ret_str.chomp!
  end

  def run_puzzle
    menu_option = "a"
    while menu_option != "q"
      print self.to_s
      puts
      puts
      print "Make a selection (u, d, l, r, s, q): "
      menu_option = gets.chomp
      case menu_option
      when "u"
        self.move_up
      when "d"
        self.move_down
      when "l"
        self.move_left
      when "r"
        self.move_right
      when "s"
        self.solve
      end
    end
  end

end

puzzle = Puzzle.new(3, 3)
puzzle.run_puzzle