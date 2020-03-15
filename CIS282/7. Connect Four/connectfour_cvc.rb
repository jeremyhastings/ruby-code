############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Final Project - Connect Four
#  Date:         November 24th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Create a ruby program using double arrays
#                which simulates the "connect four" game.
#
############################################################

# Checks for win based off directions from win logic returns game over value.
# Needs: array, int, int, int, int
def win_logic(board_to_process, scan_row, scan_column, row_increment, column_increment, owner_of_piece)

  # The game piece that was dropped is the first in the connection.
  connected = 1
  # This counter serves two functions in the while loop following.
  # First it is to get out of the while loop but it is also used to verify connection.
  counter = 1

  while counter != 4 do
    # The increments are what determine the direction of the scan
    scan_row = scan_row + (row_increment)
    scan_column = scan_column + (column_increment)
    # This makes sure all scans stay within the boundaries of the board
    if (scan_row > -1) && (scan_column > -1)
      # This makes sure all scans stay within the boundaries of the board
      if (board_to_process[scan_row].nil? == false) && (board_to_process[scan_row][scan_column].nil? == false)
        # This checks to see if there is a piece of the same kind "X" or "0"
        if (board_to_process[scan_row][scan_column] == "#{owner_of_piece}")
          # if the piece is of the same kind this verifies its connected by measuring the connection vs the counter
          # If I have X0X without the verification this would register as 2 connected pieces.  The counter insures that
          # its not.  Since the counter would be at 2 and the connected would be at 1 this piece would not be connected.
          # This is important because the amount of connected pieces determines how many spaces in the other direction
          # we go.
          if connected == counter
            connected = connected + 1
          end
        end
      end
    end
    counter += 1
  end

  # This resets the start point back to its original position
  scan_row = scan_row - (row_increment * 3)
  scan_column = scan_column - (column_increment * 3)
  # If the board is in win state no need to continue onward.
  if connected < 4
    # Go in the opposite direction

    case
    when row_increment < 0
      row_increment = row_increment + 2
    when row_increment > 0
      row_increment = row_increment - 2
    end
    case
    when column_increment < 0
      column_increment = column_increment + 2
    when column_increment > 0
      column_increment = column_increment - 2
    end
    # This makes the scan go in the opposite direction the number of spaces that would be required to connect four.
    # So if I have XX.X.. and I drop my piece to make XXXX.. It needs to look in both directions to create a win state.
    # In this instance it would look once to the right and see that it is connected to one piece.  It would then only
    # look two spaces in the opposite direction since that is all that would be required to win.
    (4 - connected).times do
      scan_row = scan_row + (row_increment)
      scan_column = scan_column + (column_increment)
      # Stay on the board
      if (scan_row > -1) && (scan_column > -1)
        if (board_to_process[scan_row].nil? == false) && (board_to_process[scan_row][scan_column].nil? == false)
          if (board_to_process[scan_row][scan_column] == "#{owner_of_piece}")
            connected = connected + 1
          end
        end
      end
    end
  end
  if connected == 4
    return 1
  end
  return 0
end

# Prints the playing board and provides no return.
# Needs: array
def print_board(array_to_print)
  system "clear"
  puts
  column_count = 1
  print " " * 8
  while column_count <= array_to_print.length
    print "#{column_count} "
    column_count += 1
  end
  puts
  array_to_print.each do |row|
    puts "        " + "#{row.join (" ")}"
  end
end

# Process the column selection made by the player and returns the row value.
# Needs: array, int
def process_selection(game_board, selection_to_process)
  row = (game_board.count - 1)
  # Loop from the bottom of the board up.
  while row != -1
    # If Row 0 of the board is not empty return a value of -1.  Prevents nil error.
    if game_board[0][selection_to_process].include?(".") == false
      row = -1
      return row
      # otherwise return the first empty row.
    elsif game_board[row][selection_to_process].include?(".") == true
      return row
    else
      row -= 1
    end
  end
end

# Determines if there is a winning condition and returns whether the game is over or not.
# Needs: array, int, int, string
def check_for_win(check_win_board, check_win_row, check_win_column, owner_of_piece)

  # These scan every legal path (it reverses direction in win_logic) from where
  # the last piece was placed.  Based off the premise that a win state can only exist with
  # the placement of the last piece.

  vertical_win = win_logic(check_win_board, check_win_row, check_win_column, 1, 0, owner_of_piece)
  horizontal_win = win_logic(check_win_board, check_win_row, check_win_column, 0, 1, owner_of_piece)
  diagonal_win_se = win_logic(check_win_board, check_win_row, check_win_column, 1, 1, owner_of_piece)
  diagonal_win_sw = win_logic(check_win_board, check_win_row, check_win_column, 1, -1, owner_of_piece)

  if horizontal_win + vertical_win + diagonal_win_se + diagonal_win_sw > 0
    puts
    puts "Player #{owner_of_piece} wins in column #{check_win_column + 1}!!"
    return 1
  end
  return 0
end

def pause() # :)
  print "\nPress <Enter> to Continue\n"
  return gets.chomp
end

simple_board_array = [

    #[0]  [1]  [2]  [3]  [4]  [5]  [6]  [7]
    [".", ".", ".", ".", ".", ".", ".", "."], # [0]
    [".", ".", ".", ".", ".", ".", ".", "."], # [1]
    [".", ".", ".", ".", ".", ".", ".", "."], # [2]
    [".", ".", ".", ".", ".", ".", ".", "."], # [3]
    [".", ".", ".", ".", ".", ".", ".", "."], # [4]
    [".", ".", ".", ".", ".", ".", ".", "."], # [5]
    [".", ".", ".", ".", ".", ".", ".", "."], # [6]
    [".", ".", ".", ".", ".", ".", ".", "."] # [7]
]

game_over = 0
x_row_move = -1
while game_over == 0
  if x_row_move == -1
    print_board(simple_board_array)
  end
  x_player_moved = 0
  while x_player_moved != 1
    x_player_selection = rand(0..7)
    x_player_row_move = process_selection(simple_board_array, x_player_selection)
    if x_player_row_move != -1
      simple_board_array[x_player_row_move][x_player_selection] = "X"
      print_board(simple_board_array)
      game_over = check_for_win(simple_board_array, x_player_row_move, x_player_selection, "X")
      x_player_moved = 1
    end
  end
  if game_over == 0
    y_player_moved = 0
    while y_player_moved != 1
      y_player_selection = rand(0..7)
      y_player_row_move = process_selection(simple_board_array, y_player_selection)
      if y_player_row_move != -1
        simple_board_array[y_player_row_move][y_player_selection] = "0"
        print_board(simple_board_array)
        game_over = check_for_win(simple_board_array, y_player_row_move, y_player_selection, "0")
        y_player_moved = 1
      end
    end
  end
  if simple_board_array[0].include?(".") != true && game_over == 0
    puts "The game is a tie."
    game_over = 1
  end
  pause()
end