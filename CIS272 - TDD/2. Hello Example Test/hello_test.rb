require 'test/unit'
require_relative 'hello'

class TestHello < Test::Unit::TestCase

  def setup
    puts "Inside Setup"
    @hello = Hello.new("Jeremy", "Hastings")
  end

  # Method must start with test_
  def test_hello
    # hello = Hello.new("Jeremy", "Hastings")
    assert_equal("Jeremy", @hello.first_name, "Testing first_name getter")
    assert_equal("Hastings", @hello.last_name, "Testing last_name getter")
  end

  def test_hello_setters
    # hello = Hello.new("Jeremy", "Hastings")
    @hello.first_name = "Joe"
    assert_equal("Joe", @hello.first_name, "Testing first_name setter")
    @hello.last_name = "Smith"
    assert_equal("Smith", @hello.last_name, "Testing last_name setter")
  end

  def test_fullname
    # hello = Hello.new("Jeremy", "Hastings")
    assert_equal("Jeremy Hastings", @hello.full_name, "Testing full_name")
    @hello.middle_name = "James"
    assert_equal("Jeremy James Hastings", @hello.full_name, "Testing full_name")
  end

end

# Functional Tests
# a = Hello.new("Jeremy", "Hastings")
# puts a
# puts a.first_name == "Jeremy" # Assertion: I am asserting that 2 values are the same.
# puts a.last_name == "Hastings"
#
# # Test Setters
# a.first_name = "Joe"
# puts a.first_name == "Joe"
#
# puts a.full_name == "Joe Hastings"
#
# a.middle_name = "Steve"
# puts a.full_name == "Joe Steve Hastings"

# Regression Testing
