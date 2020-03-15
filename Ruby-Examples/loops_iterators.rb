# While

counter = 1
while counter < 11
  puts counter
  counter = counter + 1
end

# Until

counter = 1
until counter > 10
  puts counter
  counter += 1

end

# For (inclusive)

for num in 1..10
  puts num
end

# For (exclusive)

for num in 1...10
  puts num
end

# Loop Do

i = 20
loop do
  i -= 1
  next if i % 2 != 0
  print "#{i}"
  break if i <= 0
end

# Next if / Break if

i = 20
loop do
  i -= 1
  next if i % 2 != 0
  print "#{i}"
  break if i <= 0
end

# .each iterator

array = [1,2,3,4,5]

array.each do |x|
  x += 10
  print "#{x}"
end

# .times iterator

5.times { print "Johnny Five is Still Alive! " }


