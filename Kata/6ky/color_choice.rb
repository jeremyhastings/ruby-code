# def checkchoose(m, n)
#   if m >= 0 && n > 0
#     (1...n).each do |x|
#       if m == ((1..n).inject(:*) / ((1..x).inject(:*) * (1..(n - x)).inject(:*)))
#         return x
#       end
#     end
#     return -1
#   end
#   0
# end

puts checkchoose(6, 4)

def checkchoose(m, n)
  (1...n).each do |x|
    if m == ((1..n).inject(:*) / ((1..x).inject(:*) * (1..(n - x)).inject(:*)))
      return x
    end
  end
  -1
end