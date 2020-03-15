############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Header Comment Output
#  Date:         September 29th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Ask for user input to create a standard header comment for files
#
############################################################

# Prompt user for name
print "What is your name? "

# Assign variable, remove carriage return, and capitalise.
name = gets.chomp.split.map(&:capitalize).join(' ')

# Prompt user for assignment
print "What is the assignment? "

# Assign variable, remove carriage return, and capitalise.
assignment = gets.chomp.split.map(&:capitalize).join(' ')

# Prompt user for date
print "What is today's date? "

# Assign variable, remove carriage return. and capitalise.
date = gets.chomp.split.map(&:capitalize).join(' ')

# Prompt user for class number
print "What is the class number? "

# Assign variable, remove carriage return, and upcase.
course_number = gets.chomp.upcase

# Prompt user for description
puts "What is the description of the assignment? "

# Assign variable, remove carriage return, and capitalise.
description = gets.chomp.capitalize

# Create top border of header
puts "#" * 60
puts "#"
# Print name to screen with carriage return
puts "#  Name:         #{name}"

# Print assignment to screen with carriage return
puts "#  Assignment:   #{assignment}"

# Print date to screen with carriage return
puts "#  Date:         #{date}"

# Print class number to screen with carriage return
puts "#  Class:        #{course_number}"

# Print class description to screen with carriage return
puts "#  Description:  #{description}"

# Create bottom border of header
puts "#"
puts "#" * 60