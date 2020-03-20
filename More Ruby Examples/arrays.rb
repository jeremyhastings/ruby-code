arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print arr
puts
# print arr
puts arr.last
# puts x = 1..100
# puts x.class
# print x.to_a
# print x.to_a.shuffle
# puts x
# z = x.to_a.shuffle!
# print z
# puts
# z.reverse
# print z
# puts
# z.reverse!
# print z
# puts

arr << 10
print arr
puts
arr.unshift("Jeremy")
arr.append("Jeremy")
print arr
puts
arr.uniq!
print arr
puts
puts arr.empty?
arr.include?("Jeremy")
arr.push("new item")
b = arr.pop
puts b
print arr
puts
puts arr.join
puts arr.join("-")
puts arr.join(", ")
puts b = arr.join("-")
puts b.split("-")
z = %w(My name is Jeremy and this is great Ruby is amazing)
print z
puts
puts z[0]
puts z[1]

z.each { |i| print i.capitalize + " " }

z = (1..100).to_a.shuffle
z.select { |number | puts number if number.odd? }
y = []
z.select {|number| y << number if number.odd? }
print y