require_relative 'crud'

# $LOAD_PATH << "."
# require 'crud'

users = [
    { username: "jeremy", password: "password1" },
    { username: "dave", password: "password2" },
    { username: "bret", password: "password3" },
    { username: "brian", password: "password4" },
    { username: "chris", password: "password5" }
]

hashed_users = Crud.create_secure_users(users)
puts hashed_users