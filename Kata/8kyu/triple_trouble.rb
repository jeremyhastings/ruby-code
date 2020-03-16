def triple_trouble(one, two, three)
  # ret_str = ""
  # (0...one.length).each { | x |
  #   ret_str += (one[x] + two[x] + three[x])
  # }
  # ret_str
  one.chars.zip(two.chars, three.chars).join("")
end
