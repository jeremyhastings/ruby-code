############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Arrays-histogram
#  Date:         October 26th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Design and implement an application that creates a histogram that allows you to visually inspect the frequency distribution of a set of values
#
############################################################

# num[0] Random Numbers
# num[1] Counter Starting at 1 <while Timer> <basis for front range>
# num[2] Counter Starting at 100 <while Timer>
# num[3] Counter Starting at 1
# num[4] Counter Array Storage [10][20][30][40][50][60][70][80][90][100] <basis for rear range by pulling array coordinates>
# num [5] String Array for Headers [0] 6 dashes [1] 8 dashes [2] 30 dashes

num = [200.times.map {rand(1..100)}, 1, 100, 1, 10, [("-" * 6), ("-" * 8), ("-" * 30)]]
puts "Range".rjust(6) + "# Found".rjust(14) + "Chart".rjust(17) + "\n" + "#{num[5][0]}".rjust(7) + "#{num[5][1]}".rjust(14) + (" ".rjust(11)) + "#{num[5][2]}"
while num[1] < num[2]
  num[num[4]] = num[0].select.count {|n| n >= num[3] && n <= num[4]}
  puts "#{num[1]}".rjust(2) + "-".center(3) + "#{num[4]}".rjust(3) + "|".rjust(7) + "#{num[num[4]]}".rjust(3) + "|".rjust(2) + " ".rjust(12) + ("*" * num[num[4]])
  num[1] += 10; num[3] += 10; num[4] += 10;
end

# num = [200.times.map {rand(1..100)}, 0, 100, 1, 10, [" Range", (" " * 7), "# Found", (" " * 12), "Chart", ("-" * 6), (" " * 6), ("-" * 8), (" " * 11), ("-" * 30)], [" 1 -  10", "11 -  20", "21 -  30", "31 -  40", "41 -  50", "51 -  60", "61 -  70", "71 -  80", "81 -  90", "91 - 100"]]
# puts "#{num[5][0]}" + "#{num[5][1]}" + "#{num[5][2]}" + "#{num[5][3]}" + "#{num[5][4]}" + "\n" + "#{num[5][5]}" + "#{num[5][6]}" + "#{num[5][7]}" + "#{num[5][8]}" + "#{num[5][9]}"
# while num[1] * 10 != num[2] do
#   num[num[4]] = num[0].select.count {|n| n >= num[3] && n <= num[4]}
#   if num[num[4]] < 10 then
#     puts "#{num[6][num[1]]}" + "#{num[5][6]}" + "|" + "  #{num[num[4]]}" + " |" + "#{num[5][3]}" + ("*" * num[num[4]])
#   else
#     puts "#{num[6][num[1]]}" + "#{num[5][6]}" + "|" + " #{num[num[4]]}" + " |" + "#{num[5][3]}" + ("*" * num[num[4]])
#   end
#   num[1] += 1; num[3] += 10; num[4] += 10;
# end
#
# num = [200.times.map {rand(1..100)}, 0, 100, 1, 10, [" Range", (" " * 7), "# Found", (" " * 12), "Chart", ("-" * 6), (" " * 6), ("-" * 8), (" " * 11), ("-" * 30)], [" 1 -  10", "11 -  20", "21 -  30", "31 -  40", "41 -  50", "51 -  60", "61 -  70", "71 -  80", "81 -  90", "91 - 100"]]
# puts "#{num[5][0]}" + "#{num[5][1]}" + "#{num[5][2]}" + "#{num[5][3]}" + "#{num[5][4]}" + "\n" + "#{num[5][5]}" + "#{num[5][6]}" + "#{num[5][7]}" + "#{num[5][8]}" + "#{num[5][9]}"
# while num[1] * 10 != num[2] do num[num[4]] = num[0].select.count {|n| n >= num[3] && n <= num[4]}
# if num[num[4]] < 10 then puts "#{num[6][num[1]]}" + "#{num[5][6]}" + "|" + "  #{num[num[4]]}" + " |" + "#{num[5][3]}" + ("*" * num[num[4]]) else puts "#{num[6][num[1]]}" + "#{num[5][6]}" + "|" + " #{num[num[4]]}" + " |" + "#{num[5][3]}" + ("*" * num[num[4]]) end
# num[1] += 1; num[3] += 10; num[4] += 10; end