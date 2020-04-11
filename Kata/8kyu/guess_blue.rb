def guess_blue(blue_start, red_start, blue_pulled, red_pulled)
  (blue_start - blue_pulled).to_f / (blue_start + red_start - blue_pulled - red_pulled)
end

puts guess_blue(5, 5, 2, 3)