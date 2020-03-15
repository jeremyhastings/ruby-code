class Hello

  attr_accessor :first_name, :last_name, :middle_name

  def initialize(first, last)
    @first_name = first
    @last_name = last
  end

  def full_name
    ret_str = ""
    if( !@middle_name.nil?)
      "#{first_name} #{middle_name} #{last_name}"
    else
      return "#{first_name} #{last_name}"
    end

  end


  def to_s
    return "Hello #{@first_name} #{@last_name} World"
  end

end


