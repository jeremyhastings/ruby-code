require 'test/unit'
require_relative 'fizzbuzz'

class TestFizzBuzz < Test::Unit::TestCase

  def test_fizz
    assert_equal( "Fizz", FizzBuzz.show(3), "Testing 3")
    assert_equal("1", FizzBuzz.show(1), "Testing 1")
    assert_equal("2", FizzBuzz.show(2), "Testing 2")
    assert_equal("4", FizzBuzz.show(4), "Testing 4")
    assert_equal("Buzz", FizzBuzz.show(5), "Testing 5")
    assert_equal("Fizz", FizzBuzz.show(6), "Testing 6")
    assert_equal("7", FizzBuzz.show(7), "Testing 7")
    assert_equal("8", FizzBuzz.show(8), "Testing 8")
    assert_equal("Fizz", FizzBuzz.show(9), "Testing 9")
    assert_equal("Buzz", FizzBuzz.show(10), "Testing 10")
    assert_equal("11", FizzBuzz.show(11), "Testing 11")
    assert_equal("Fizz", FizzBuzz.show(12), "Testing 12")
    assert_equal("13", FizzBuzz.show(13), "Testing 13")
    assert_equal("14", FizzBuzz.show(14), "Testing 14")
    assert_equal("FizzBuzz", FizzBuzz.show(75), "Testing 15")
    assert_equal("FizzBuzz", FizzBuzz.show(45), "Testing 15")
    assert_equal("Buzz", FizzBuzz.show(80), "Testing 80")

  end

  def test_all
    assert_equal("1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz",
                 FizzBuzz.all(15), "Testing all numbers up to 15")
  end

end