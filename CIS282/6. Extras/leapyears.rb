############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Extra Credit #4
#  Date:         November 17th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Ask the user to enter a starting year and
#  an ending year.  print out all the years between those
#  2 years (inclusive that are considered leap years.
#
############################################################

def find_leap_years (starting, ending)

  leap_years = []
  while starting != ending + 1
    if starting % 4 == 0
      if starting % 100 == 0
        if starting % 400 == 0
          leap_years.push(starting).to_s
        end
      else
        leap_years.push(starting.to_s)
      end
    end
    starting += 1
  end
  return leap_years
end

def display_leap_years (array_to_display, start, finish)

  puts
  puts "Leap Years between #{start} and #{finish}:"
  puts

  total_years = array_to_display.count
  counter = 0
  while counter != total_years
    print"#{array_to_display[counter]}"
    counter += 1
    if counter != total_years
      print ", "
    end
    if counter % 8 == 0
      puts
    end
  end
end

print "Please enter the starting year: "
starting_year = gets.to_i
puts
print "Please enter the ending year: "
ending_year = gets.to_i

leap_years = find_leap_years(starting_year, ending_year)

display_leap_years(leap_years, starting_year, ending_year)
