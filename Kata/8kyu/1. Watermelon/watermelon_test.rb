require 'test/unit'
require_relative 'watermelon'

class TestWatermelon < Test::Unit::TestCase


  def test_all
    assert_equal(true, Watermelon.divide(4), "Testing 4")
    assert_equal(false, Watermelon.divide(2),"Testing 2")
    assert_equal(false, Watermelon.divide(5), "Testing 5")
    assert_equal(true, Watermelon.divide(88), "Testing 88")
    assert_equal(true, Watermelon.divide(100), "Testing 100")
    assert_equal(false, Watermelon.divide(67), "Testing 67")
    assert_equal(true, Watermelon.divide(90), "Testing 90")
    assert_equal(true, Watermelon.divide(10), "Testing 10")
    assert_equal(false, Watermelon.divide(99), "Testing 99")
    assert_equal(true, Watermelon.divide(32), "Testing 32")
  end
end
