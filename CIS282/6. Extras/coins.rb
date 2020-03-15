############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Extra Credit #1 - Coins
#  Date:         November 16th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Write an application in ruby that determines
#  the value of the coins in a jar and prints the total in
#  dollars and cents.
#
############################################################

print "Please enter the number of quarters: "
quarters = gets.to_i
print "Please enter the number of dimes: "
dimes = gets.to_i
print "Please enter the number of nickels: "
nickels = gets.to_i
print "Please enter the number of pennies: "
pennies = gets.to_i
puts
sum_total = (quarters * 0.25) + (dimes * 0.10) + (nickels * 0.05) + (pennies * 0.01)
print "You have #{quarters} quarters, #{dimes} dimes, #{nickels} nickels, and #{pennies} pennies for a total of $#{sum_total = sprintf("%.2f", sum_total)}"