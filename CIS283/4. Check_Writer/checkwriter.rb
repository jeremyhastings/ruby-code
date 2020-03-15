############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Checkwriter
#  Date:         May 17th, 2019
#  Class:        CIS 282 - PROGRAMMING PRINCIPLES II
#  Description:  Create a program that creates a class that
#                extends the built-in ruby class float.
#
############################################################

class Float

  def to_check_string

    ######### Legend #########
    # c = change (as in spare change)
    # s_to_p = string_to_print
    # nh = number_hash
    # n = number_given
    # x = array_to_process
    # ts = teen_string
    #

    # This lets me know if I have some spare change down at the bottom
    c = 0
    # My empty string to see if you gave me a bunch of zeroes
    s_to_p = ""
    # My precious
    nh = { 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven",
                 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
                 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty",
                 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety",
                 100 => "hundred", 1000 => "thousand", "." => "and", 0 => "Zero" }

    # This takes the number given and turns it into a string that goes out two decimal places
    n = sprintf("%.2f", self)
    # This takes the above string and puts each character in the string lovingly into its own index
    x = n.split(//)

    # This is where the magic begins as the number rides the loop of DOOM!
    # I started commenting at the bottom but I'm just explaining the if/elsif/else statements
    # Basically it gets processed based on its length and then takes care of all the different
    # possibilities for the number conversions.  Not very sophisticated, I know ... It's horrible.
    # But it works :D

    until x.length == 0

      case x.length

      when 9
        case x.slice(1,3).join.to_i
        when 1..999
          if(x.slice(1,2).join.to_i == 0)
           s_to_p += (nh[x[0].to_i] + " " + nh[100] + " " + nh[1000] + ", ")
          else
            s_to_p += (nh[x[0].to_i] + " " + nh[100] + " ")
          end
        else
          s_to_p += (nh[x[0].to_i] + " " + nh[100] + " " + nh[1000] + " ")
        end

      when 8
        case x[0].to_i
        when 3..9
          if(x[1].to_i == 0)
            s_to_p += (nh[x[0].to_i * 10] + " " + nh[1000] + ", ")
          else
            s_to_p += (nh[x[0].to_i * 10] + " ")
          end
        when 2
          if(x[1].to_i == 0)
            if(x.slice(1,3).join.to_i == 0 )
              ts = x.slice(0,2).join.to_i
              s_to_p += (nh[ts] + " " + nh[1000] + " ")
            else
              ts = x.slice(0,2).join.to_i
              s_to_p += (nh[ts] + " " + nh[1000] + ", ")
            end
          else
            s_to_p += (nh[x[0].to_i * 10] + " ")
          end
        when 1
          ts = x.slice(0,2).join.to_i
          s_to_p += (nh[ts] + " " + nh[1000] + ", ")
          x.shift # choppity chop index 0, no soup for you
        end

      when 7
        case x.slice(1,3).join.to_i
        when 1..999
          s_to_p += (nh[x[0].to_i] + " " + nh[1000] + ", ")
        else
          s_to_p += (nh[x[0].to_i] + " " + nh[1000] + " ")
        end

      when 6
        s_to_p += (nh[x[0].to_i] + " " + nh[100] + " ")

      when 5
        case x[0].to_i
        when 3..9
          s_to_p += (nh[x[0].to_i * 10] + " ")
        when 2
          if(x[1].to_i == 0)
            ts = x.slice(0,2).join.to_i
            s_to_p += (nh[ts] + " ")
          else
            s_to_p += (nh[x[0].to_i * 10] + " ")
          end
        when 1
            ts = x.slice(0,2).join.to_i
            s_to_p += (nh[ts] + " dollars ")
            x.shift # choppity chop index 0, no soup for you
        end

      when 4
        if ((x[0].to_i == 0) && (s_to_p == ""))
          s_to_p += (nh[x[0].to_i] + " dollars ")
        elsif ((x[0].to_i == 1) && (s_to_p == ""))
          s_to_p += (nh[x[0].to_i] + " dollar ")
        elsif (x[0].to_i != 0)
          s_to_p += (nh[x[0].to_i] + " dollars ")
        else
          s_to_p += "dollars "
        end

      when 3
        s_to_p += (nh[x[0]] + " ") # and

      when 2
        if (x[0].to_i >= 2) # if it is 2 or greater
          s_to_p += (nh[x[0].to_i * 10] + " ")
          c = 1 # we have change
        elsif ((x[0].to_i < 2) && (x[0].to_i != 0)) # if it is less than 2 but not 0
          ts = x.slice(0,2).join.to_i # turn it into a teen like Big but a couple years later
          s_to_p += (nh[ts] + " Cents")
          x.shift # choppity chop index 0, no soup for you
        end

      when 1
        if (x[0].to_i == 0 && c == 0) # if it is zero and no change in front of it
          s_to_p += (nh[x[0].to_i] + " Cents")
        elsif (x[0].to_i == 0 && c == 1) # if it is zero and there is something in front of it
          s_to_p += "Cents"
        elsif (x[0].to_i == 1 && c == 0) # if it is one penny
          s_to_p += (nh[x[0].to_i] + " Cent")
        else
          s_to_p += (nh[x[0].to_i] + " Cents") # everything else
        end
      end

      # This is for tricksy hobbitses that try to sneak a bunch of zeroes by my precious.
      if(x.length > 4)
        # choppity chop index 0, no soup for you
        x.shift
        # temporarily turn it back into a float thus destroying all zeroes
        temp = x.join.to_f
        # back into a string
        n_temp = sprintf("%.2f", temp)
        # back into its box
        x = n_temp.to_s.split(//)
      else
        # choppity chop index 0, no soup for you
        x.shift
      end
    end

    return s_to_p

  end

end

# puts (10.25 + 40.30).to_check_string

# print "enter a number: "
# given_number = gets.to_f
# puts given_number.to_check_string