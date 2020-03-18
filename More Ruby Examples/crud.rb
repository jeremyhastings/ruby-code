module Crud
  require 'bcrypt'
  puts "Module CRUD activated"
# users = [
#     { username: "jeremy", password: "password1" },
#     { username: "dave", password: "password2" },
#     { username: "bret", password: "password3" },
#     { username: "brian", password: "password4" },
#     { username: "chris", password: "password5" }
# ]

# my_password = BCrypt::Password.create("my password")
# puts my_password
# my_password = BCrypt::Password.new("$2a$12$MV2vu2PQza4NZrIBSv9gzO/1mKRWOYB37XMFL/r6kuTOChYU8XtZK")
# puts my_password == "my password"
# puts my_password == "not my password"

  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def self.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def self.create_secure_users(list_of_users)
    list_of_users.each do | user_record |
      user_record[:password] = create_hash_digest(user_record[:password])
    end
  # list_of_users
  end

# new_users = create_secure_users(users)
# puts new_users

  def self.authenticate_user(username, password, list_of_users)
    list_of_users.each do | user_record |
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
       return user_record
     end
   end
    "Credentials were not correct"
  end
end
#
# puts
# puts authenticate_user("jeremy", "password1", new_users)
# puts
# puts authenticate_user("jeremy", "password14", new_users)
# new_password = create_hash_digest("password1")
# puts new_password == "password1"
# puts new_password == "password2"
# puts new_password
# puts verify_has_digest(new_password) == "password1"
# puts users
# puts create_secure_users(users)