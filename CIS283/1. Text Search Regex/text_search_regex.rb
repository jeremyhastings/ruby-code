############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Text Search With Regular Expressions
#  Date:         April 11th, 2019
#  Class:        CIS 283 - PROGRAMMING PRINCIPLES II
#  Description:  Write a program that will search through a
#                data file using regular expressions.
#
############################################################


# Declare while loop exit variable
article_fifty = ""

# Main while loop for program
while article_fifty != "BREXIT"

  # Welcome Message Explaining Functionality
  puts
  puts "To search for a class enter the Department and Class Number where prompted."
  puts "To exit type 'EXIT' as the Department."
  puts

  # Ask for Department
  print "Enter Department: "
  department = gets.chomp()

  # Determine if user wants to EXIT or not
  if department != "EXIT"

    # Ask for Class Number
    print "Enter Class Number: "
    class_number = gets.chomp()
    puts

    # Load File
    list_of_classes = File.open("Enrollment.txt")

    # Declaration of found match variable
    found = 0

    # Search while loop that goes through file line by line
    while !list_of_classes.eof?

      # Load line into variable
      line = list_of_classes.gets.chomp

      # Check to see if a matching search has already been found
      if found == 1

        # If the next line is not a class, blank spaces that end in underscores, or a line that starts with ^
        if line !~ /\s*(\w|\d)\d{3}\s\D{2,5}\s*\d{3}/ && line !~ /\s*_/ && line !~ /^\^/ && line !~ /^\s*$/
          # Then print the line
          puts line
        else
          # Otherwise declare that the line is not a match and carry on.
          found = 0
        end
      end

      # If the line matches the department and class entered print the line and declare a found class
      if line =~ /\s*(\w|\d)\d{3}\s#{department}\s*#{class_number}.*/
        puts line
        found = 1
      end
    end

    # Close File
    list_of_classes.close
  else
    # If they want to Exit than let them BREXIT
    article_fifty = "BREXIT"
  end
end