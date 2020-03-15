############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Hash Assignment
#  Date:         November 7th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Create a menu driven program to interact
#                with a set of products.
#
############################################################

# Easier to understand?

# Opens a file, reads a file, and then processes an array into a hash.
def start (file_to_open = "products.txt")

  # Created this method so it can be used with any file.  It just needs to be changed at the method invocation.
  # Better yet, it can be later used to allow the user to enter the file they wish to open.

  product_file = File.open("#{file_to_open}")
  product_array = []

  until product_file.eof?

    # This is the magic necessary to take each line from the file and create the hash as designed.
    # What is this doing?  It starts by taking the count (so if empty it is 0) and uses that as its target in the
    # array being created.  It now has an array at each index spot consisting of three strings.  It then takes the [0]
    # of that array and makes it an integer and then the [2] of that array and makes it a floating point.

    product_array[product_array.count] = product_file.gets.chomp.split(',').map {|product_info| product_info}

    # The -1 makes it modify the entry that was just created which increased the count by 1

    product_array[product_array.count - 1][0] = product_array[product_array.count - 1][0].to_i
    product_array[product_array.count - 1][2] = product_array[product_array.count - 1][2].to_f

  end

  product_file.close

  processed_array_hash = {}

  product_array.each do |item|
    processed_array_hash[item[0]] = item[1, 2]
  end

  return processed_array_hash
end

# Creates a simple menu from an array of strings.
def menu (menu_to_display)

  puts
  menu_to_display.each_with_index do |item, index|
    print "#{ index + 1 }.)  "
    puts "#{ item }"
  end

  print "\n"
  print "Please Enter a Selection: "
  selection = gets.chomp

  return selection
end

# Displays hash in responsive three column listing.
def view_products(hash_to_display, column1 = "Item", column2 = "Description", column3 = "Price")

  # Method designed to receive any hash in correct format and display them.
  # Method also setup so the headline text can be changed ... Say "CataLog ID" instead of "Item"

  # These variables are to create a minimum spread between the columns.
  description_spread = 10; price_spread = 6;

  # This cycles through the hash to determine which values are longest
  hash_to_display.each do |key, value|

    if value[0].length > description_spread
      description_spread = value[0].length.to_i
    end

    if value[1].to_s.length > price_spread
      price_spread = value[1].to_s.length.to_i
    end
  end

  puts

  # The columns are seperated into 1, 2, 3 just for ease of use.  A value can be included with the method
  # call or the defaults can be used for the column titles.  The column titles, the dashes, prices, and all products
  # have a responsive display so everything always lines up.

  puts "#{column1}".ljust(15) + "#{column2}".ljust(15 + description_spread) + "#{column3}".rjust(price_spread + 1)
  puts ("-" * (column1.length)).ljust(15) + ("-" * (column2.length)).ljust(15 + description_spread) +
           ("-" * (column3.length)).rjust(price_spread + 1)

  # This sorts the hash into an array by item number.  Then it is converted back into a hash where
  # for each key, move the key into variables formatted as strings.

  hash_to_display.sort.to_h.each do |key, value|
    item = key; description = value[0]; price = value[1]
    puts "#{item = sprintf("%03d", item)}".ljust(15) +
             "#{description}".split.map(&:capitalize).join(' ').ljust(15 + description_spread) +
             "#{price = sprintf("%.2f", price)}".rjust(price_spread + 1)

  end
end

# Generates random unique key based off declared user range.
def random_key (hash_to_test, key_limit)

  # This is to create a variable for my loop and the first key to test.  If its unique, job is already over.
  new_key = rand(1...key_limit)

  until hash_to_test.has_key?(new_key) == false
    new_key = rand(1...key_limit)
  end

  return new_key
end

# Creates a new product description
def new_product_description

  puts
  print "Please Enter New a Product Description: "
  description_value = gets.chomp
  puts

  # I don't think a description for a catalog should be left blank.  To allow for the idea that
  # an item might not have a description yet but the price is known it is entered as Reserved.
  # And if they really want a blank value they just need to hit the spacebar.

  if description_value == ""
    description_value = "Reserved"
  end

  return description_value
end

# Create a new product price
def new_product_value

  print "Please Enter a New Product Price: "
  price_value = gets.to_f
  puts

  return price_value
end

# Confirm modifications of hash
def confirm_modification (new_key, test_hash, hash_to_modify, mod_type = "Modification", y = "Y", n = "N")

  # Why create this in the first place?  I didn't think it made sense to have a catalog you could make entries to
  # without some sort of confirmation.

  # Why all the input?  I altered the Add Product Confirmation to accept any modification for confirmation.
  # This reverses the process for deletes.  The key that enters as test_key has already been deleted from the
  # hash to modify.  If it is a confirmed delete it does nothing.  If its an add or an update it gets deleted from test
  # and inserted into the hash being returned.

  # hash_mod_confirmation and hash_add_confirmation can have their 'polarity reversed'.  This is how the delete
  # confirmation is handled.  All the modifications are a delete from one hash to another 'holding' hash.  Since it
  # is already deleted the delete just moves through.  When it is doing an add or an update it deletes it from the test
  # hash into the hash being modified and returns it.

  hash_mod_confirmation = "#{n}";

  view_products(test_hash)
  while hash_mod_confirmation != "#{y}"

    puts
    print "Make this #{mod_type} to the Product List (Y/N)? "
    hash_add_confirmation = gets.chomp.upcase

    if hash_add_confirmation == "#{y}"
      hash_to_modify[new_key] = test_hash.delete(new_key)

      return hash_to_modify

    elsif hash_add_confirmation == "#{n}"

      return hash_to_modify
    end
  end
end

# Deletes items from hash based off integer key.
def delete_item (hash_to_delete)

  print "Please Enter the Product Item Number to Delete: "
  product_deletion = gets.to_i

  if hash_to_delete.has_key?(product_deletion) == true
    test_hash = {}

    # This deletes the key from the hash to delete from and moves it into a 'holding hash'.  The hash and the
    # holding hash are sent to the confirmation method where if its confirmed the hash to delete is returned unaltered.
    # If not confirmed moves the key from the 'holding hash' back into the hash to delete from.

    test_hash[product_deletion] = hash_to_delete.delete(product_deletion)
    hash_to_delete = confirm_modification(product_deletion, test_hash, hash_to_delete, "Deletion", "N", "Y")

  else

    invalid_entry()
  end

  return hash_to_delete
end

# Updates an item description or price, and is menu driven
def update_item (hash_to_update, product_update, update_menu)

  if hash_to_update.has_key?(product_update) == true
    done_updating = ""

    while done_updating != "Y"
      update_selection = menu(update_menu)

      # The values from the hash need to be pulled into a temporary array and broken down into variables.  Why?
      # Good question.  If the values are not broken down and stored when sent for confirmation an error occurs and
      # you can end up making writes to the hash even if you don't confirm.  This way the variables are peeled off
      # from the hash.  The values are overwritten by the users selection.  A 'holding hash' with the new description
      # or price is sent in for confirmation.  If declined it dies, if accepted it injects into the hash being updated.
      # When it loops back through, the new values get placed into the temporary array.

      temp_array = hash_to_update.values_at(product_update)
      price_value = temp_array[0][1]; description_value = temp_array[0][0]
      test_hash = {};

      if update_selection == "1"
        new_description_value = new_product_description()
        puts
        test_hash[product_update] = [new_description_value, price_value]
        hash_to_update = confirm_modification(product_update, test_hash, hash_to_update, "Update")

      elsif update_selection == "2"
        new_price_value = new_product_value()
        test_hash[product_update] = [description_value, new_price_value]
        hash_to_update = confirm_modification(product_update, test_hash, hash_to_update, "Update")

      elsif update_selection == "3"
        done_updating = "Y"
      end
    end

  else
    invalid_entry()
  end

  return hash_to_update
end

# Finds lowest price in a hash
def lowest_price (hash_to_scan)

  test_hash = {}; test_array = []
  test_array[0] = hash_to_scan.min_by {|key, value| value[1]}

  test_array.each do |item|
    test_hash[item[0]] = item[1]
  end

  puts
  puts "The Lowest Priced Item:"
  view_products(test_hash)
end

# Finds highest price in a hash
def highest_price (hash_to_scan)

  test_hash = {}; test_array = []
  test_array[0] = hash_to_scan.max_by {|key, value| value[1]}

  test_array.each do |item|
    test_hash[item[0]] = item[1]
  end

  puts
  puts "The Highest Priced Item:"
  view_products(test_hash)
end

# Totals the value of all items and displays with $
def sum_total (hash_to_scan)
  sum_total = 0.00

  hash_to_scan.each do |key, value|
    sum_total = sum_total + value[1]
  end

  puts
  puts "The Total Value of All Products is: $#{sum_total = sprintf("%.2f", sum_total)}"
end

# NO SOUP FOR YOU!
def invalid_entry

  puts
  puts "Your Input is Invalid."
end

# Shut Down Method
def shut_down (file_to_save = "products.txt", hash_to_save)

  product_file = File.open("#{file_to_save}", "w")

  hash_to_save.each do |key, value|
    product_file.puts "#{key},#{value[0]},#{value[1] = sprintf("%.2f", value[1])}"
  end

  puts
  puts "Your Information was Saved."
  puts
  puts "Farewell"

  product_file.close
end

# Storage of Menu Options in Array
menu_choices = [
    "View All Products", "Add a New Product", "Delete a Product", "Update a Product",
    "View Highest Priced Product", "View Lowest Priced Product", "View Sum of All Product Prices", "Exit"]

update_menu = [
    "Update Item Description", "Update Item Price", "Done Updating Item"]

product_hash = start()

while (selection = menu(menu_choices)) != (menu_choices.length.to_s)

  if selection == "1"

    # View All Products
    view_products(product_hash)

  elsif selection == "2"

    # Add a New Product
    view_products(product_hash)
    new_key = random_key(product_hash, 1000)
    description_value = new_product_description()
    price_value = new_product_value()
    test_hash = {}
    test_hash[new_key] = [description_value, price_value]
    product_hash = confirm_modification(new_key, test_hash, product_hash, "Addition")

  elsif selection == "3"

    # Delete a Product
    view_products(product_hash)
    puts
    delete_item(product_hash)

  elsif selection == "4"

    # Update a Product
    view_products(product_hash)
    puts
    print "Please Enter the Product Item Number to Update: "
    product_update = gets.to_i
    update_item(product_hash, product_update, update_menu)

  elsif selection == "5"

    # View Highest Priced Product
    highest_price(product_hash)

  elsif selection == "6"

    # View Lowest Priced Product
    lowest_price(product_hash)

  elsif selection == "7"

    # View Sum of All Product Prices
    sum_total(product_hash)

  else

    invalid_entry()
  end
end

shut_down(product_hash)