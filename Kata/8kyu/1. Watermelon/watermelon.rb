class Watermelon
  def self.divide(weight)
    # if weight > 3
    #   if weight % 2 == 0
    #     return true
    #   end
    # end
    # false
    weight > 2 && weight.even?
  end
end
