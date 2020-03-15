############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Right Triangle
#  Date:         October 6th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Create a triangle based off the number given using a loop.
#
############################################################

# Request desired height & width from user
print "Please enter the height and width of the triangle you desire: "

# Store input as variable triangle_size
triangle_size = gets.to_i

if (triangle_size > 0)

  # Build First Triangle
  # Declare variable to build loop and triangle
  simple_triangle = 0

  # Start the triangle
  puts "*"

  # Build internal lines of triangle - 2 to account for first and last line
  while simple_triangle < ( triangle_size - 2 )
    puts "*" + (" " * simple_triangle) + "*"
    simple_triangle += 1
  end

  # Close off triangle
  if triangle_size > 1
    print "*" * ( triangle_size )
  end


  # Build Second Triangle
  # Declare variable to build loop and triangle
  number_triangle = 1

  # Run loop while number_triangle is less than triangle_size + 2 to account for first and last
  while number_triangle < (triangle_size + 2 )
    # Declare Loop Number for internal number count of triangle
    loop_number = 1
    # Run loop while loop number is less than number triangle so at first 1 is the number so it runs once
    while loop_number < number_triangle
      # It prints the modulus of the loop number by 10
      print loop_number % 10
      # increase loop number
      loop_number += 1
    end
    # After line created, carriage return and begin creation of next line
    puts
    # Increase the row width of the triangle by 1
    number_triangle += 1
  end

  # Build Third Triangle
  # Declare variable to build loop and triangle
  backwards_triangle = triangle_size

  # Start triangle
  puts " " * (triangle_size - 1) + "*"

  # Run loop while backwards_triangle is less than triangle_size minus 2 to account for first and last line
  while backwards_triangle > 2
    # take one off of backwards_triangle first (to account for first line being drawn)
    backwards_triangle -= 1
    # draw backwards_triangle worth of empty spaces + * + the difference between the end line + *
    puts (" " * (backwards_triangle - 1)) + "*" + (" " * ((triangle_size - 1 ) - backwards_triangle)) + "*"
  end

  # Close off triangle
  if triangle_size > 1
    print "*" * ( triangle_size )
  end

  # Tell User to enter a positive integer if they want a triangle
  else
    puts
    puts "Please enter a positive integer next time, this triangle I have named Null the Destroyer."
end
