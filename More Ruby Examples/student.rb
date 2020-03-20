require_relative 'crud'

class Student
  include Crud
  attr_accessor :first_name, :last_name, :email, :username, :password
  # attr_reader :username

  # @first_name
  # @last_name
  # @email
  # @username = "jeremy.hastings"
  # @password
  def initialize(firstname, lastname, email, username, password)
    @first_name = firstname
    @last_name = lastname
    @email = email
    @username = username
    @password = password
  end

  # def first_name=(name)
  #   @first_name = name
  # end
  #
  # def first_name
  #   @first_name
  # end

  # def set_username
  #   @username = "jeremy.hastings"
  # end

  def to_s
    "First name: #{@first_name}, Last name: #{@last_name}, Email: #{@email}, Username: #{@username}."
  end

end

jeremy = Student.new("Jeremy", "Hastings", "jeremy.hastings@mac.com", "jeremy.hastings", "password1")
dave = Student.new("Dave", "Jones", "dave.jones@scc.edu", "dave.jones", "password2")
# jeremy.first_name = "Jeremy"
# jeremy.last_name = "Hastings"
# jeremy.email = "jeremy.hastings@mac.com"
# jeremy.set_username
# # jeremy.username = "jeremy.hastings"
# puts jeremy.first_name
# puts jeremy.last_name
# puts jeremy.email
# puts jeremy.username
# puts jeremy
# puts dave
# dave.last_name = jeremy.last_name
# puts "Dave is altered"
# puts dave

jeremy.password = jeremy.create_hash_digest(jeremy.password)
p jeremy
