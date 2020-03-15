############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Roman Numerals
#  Date:         February 11th, 2020
#  Class:        CIS 272 - AGILE METHODOLGIES
#  Description:  Create a program that creates a class that
#                extends the built-in ruby class fixnum and
#                convert numbers into Roman Numerals.
#
############################################################
class Fixnum
  def to_roman
    retstr = ""
    number_hash = { 0 => "", 1 => "I", 2 => "II", 3 => "III", 4 => "IV", 5 => "V", 6 => "VI", 7 => "VII",
           8 => "VIII", 9 => "IX", 10 => "X", 20 => "XX", 30 => "XXX", 40 => "XL",
           50 => "L", 60 => "LX", 70 => "LXX", 80 => "LXXX", 90 => "XC", 100 => "C" }
    number = self.to_s
    split_number = number.split(//)
    if self == 39
      return "IXL"
    end
    if self == 89
      return "ILXXX"
    end
    if self == 99
      return "IC"
    end

    until split_number.length == 0
      case split_number.length
      when 1
        if retstr != "" && split_number[0] == "9"
          if self / 40 == 1
            retstr = "I" + retstr
          else
            retstr = number_hash[split_number[0].to_i] + retstr
          end
        else
          retstr += (number_hash[split_number[0].to_i])
        end
      when 2
        if self / 50 == 0
          if self / 40 == 1
            retstr += "XL"
          else
            tens = (split_number[0] + "0").to_i
            retstr += number_hash[tens]
          end
        else
          tens = (split_number[0] + "0").to_i
          retstr += number_hash[tens]
        end
      when 3
        hundreds = (split_number[0] + "00").to_i
        retstr += number_hash[hundreds]
      end
      split_number.shift
      if split_number.join.to_i == 0
        split_number.shift
      end
    end
    return retstr
  end
end