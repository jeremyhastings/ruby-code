def is_square(x)
  # x >= 0 && Integer.sqrt(x) * Integer.sqrt(x) == x
  # One I like
  # return false if number.negative?
  #
  # (Math.sqrt(number) % 1).zero?
   x < 0 ? false : Math.sqrt(x) % 1 == 0
end

puts is_square(55)