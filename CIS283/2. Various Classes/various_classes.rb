############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Project: Various Classes
#  Date:         April 11th, 2019
#  Class:        CIS 283 - PROGRAMMING PRINCIPLES II
#  Description:  Create a program which implements ruby
#  classes to store object information
#
############################################################

class Person

  def initialize (first_name, last_name, age, hair_color, eye_color)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @hair_color = hair_color
    @eye_color = eye_color
  end

  def first_name
    return @first_name
  end

  def first_name= (new_first_name)
    @first_name = new_first_name
  end

  def last_name
    return @last_name
  end

  def last_name= (new_last_name)
    @last_name = new_last_name
  end

  def age
    return @age
  end

  def age= (new_age)
    @age = new_age
  end

  def hair_color
    return @hair_color
  end

  def hair_color= (new_hair_color)
    @hair_color = new_hair_color
  end

  def eye_color
    return @eye_color
  end

  def eye_color= (new_eye_color)
    @eye_color = new_eye_color
  end

  def to_s
    return "\nFirst Name: #{first_name}\nLast Name: #{last_name}\nAge: #{age}\n" +
        "Hair Colour: #{hair_color}\nEye Colour: #{eye_color}"
  end

end

class Address

  def initialize (line1, line2, city, state, zip)
    @line1 = line1
    @line2 = line2
    @city = city
    @state = state
    @zip = zip
  end

  def line1
    return @line1
  end

  def line1= (new_line1)
    @line1 = new_line1
  end

  def line2
    return @line2
  end

  def line2= (new_line2)
    @line2 = new_line2
  end

  def city
    return @city
  end

  def city= (new_city)
    @city = new_city
  end

  def state
    return @state
  end

  def state= (new_state)
    @state = new_state
  end

  def zip
    return @zip
  end

  def zip= (new_zip)
    @zip = new_zip
  end

  def to_s
    return "\nAddress Line 1: #{@line1}\nAddress Line 2: #{@line2}\nCity: #{@city}\n" +
        "State: #{@state}\nZip: #{@zip}"
  end
end

class Character

  def initialize (name, race, hit_points, gold)
    @name = name
    @race = race
    @hit_points = hit_points
    @weapons = []
    @gold = gold
    @clothing = []
  end

  def name
    return @name
  end

  def name= (new_name)
    @name = new_name
  end

  def race
    return @race
  end

  def race= (new_race)
    @race = new_race
  end

  def hit_points
    return @hit_points
  end

  def hit_points= (new_hit_points)
    @hit_points = new_hit_points
  end

  def add_weapon(weapon_name)
    @weapons.push(weapon_name)
  end

  def drop_weapon(weapon_name)
    @weapons.delete(weapon_name)
  end

  def add_clothing(item)
    @clothing.push(item)
  end

  def drop_clothing(item)
    @clothing.delete(item)
  end

  def to_s
    return "\nName: #{@name}\nRace: #{@race}\nHit Points: #{@hit_points}\n" +
        "Weapons: #{@weapons.join(", ")}\nGold: #{@gold}\nClothing: #{@clothing.join(", ")}"
  end

end

jeremy_hastings = Person.new("Jeremy", "Hastings", 42, "Blond", "Hazel")
puts jeremy_hastings.to_s
jeremy_address = Address.new("127 N Halford", "", "Newport", "WA", "99156")
puts jeremy_address.to_s
jeremy_character = Character.new("Travel'ite", "Elf", "5", 100)
puts jeremy_character.to_s
jeremy_character.add_weapon("quarter-staff")
jeremy_character.add_weapon("wand of identify")
jeremy_character.add_weapon("dagger")
jeremy_character.add_clothing("robes")
jeremy_character.add_clothing("leather shoes")
jeremy_character.add_clothing("spectacles")
puts jeremy_character.to_s
jeremy_character.drop_weapon("wand of identify")
jeremy_character.drop_clothing("leather shoes")
puts jeremy_character.to_s