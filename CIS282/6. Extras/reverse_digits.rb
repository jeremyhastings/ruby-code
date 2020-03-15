############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Extra Credit #2 Reverse Digits
#  Date:         November 16th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Write a method called "reverse_digit" that
#  takes an integer as an argument and returns the number with
#  its digits reversed.
#
############################################################

def reverse_digit(integer_to_reverse)
  reversed_integer = 0

  while integer_to_reverse > 0
    lastDigit = integer_to_reverse % 10
    place_holder = Math.log10(integer_to_reverse).to_i + 1
    while place_holder > 1
      lastDigit = lastDigit * 10
      place_holder -= 1
    end

    reversed_integer = reversed_integer + lastDigit
    integer_to_reverse = integer_to_reverse / 10
  end

  return reversed_integer
end

# puts reverse_digit(8675309)