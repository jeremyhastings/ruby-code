# Actual Code Creation

class FizzBuzz

  def self.show(num)
    if num % 3 == 0
      if num % 5 == 0
        return "FizzBuzz"
      end
      return "Fizz"
    elsif num % 5 == 0
      return "Buzz"
    else
      return "#{num}"
    end
  end

  def self.all(num)
    retstr = ""
    num.times do | current_num |
      retstr += show(current_num + 1) + "\n"
    end
    return retstr.chomp
  end

end

# puts FizzBuzz.all(100)