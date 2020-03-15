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

  puts "*"

  for simple_triangle in 0...triangle_size - 2
    puts "*" + (" " * simple_triangle) + "*"
  end

  if triangle_size > 1
    print "*" * (triangle_size)
  end

  for number_triangle in 1...triangle_size + 2
    loop_number = 1
    while loop_number < number_triangle
      print loop_number % 10
      loop_number += 1
    end
    puts
  end

  puts " " * ( triangle_size - 1 ) + "*"

  for backwards_triangle in 1...triangle_size - 1
    space_calc = (triangle_size - backwards_triangle)
    puts (" " * (space_calc - 1)) + "*" + (" " * ((triangle_size - 1) - space_calc)) + "*"
  end

  if triangle_size > 1
    print "*" * (triangle_size)
  end

else

  puts
  puts "Please enter a positive integer next time, this triangle I have named Null the Destroyer."

end