############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Roman Numerals
#  Date:         February 11th, 2020
#  Class:        CIS 272 - AGILE METHODOLGIES
#  Description:  Create a program that creates a class that
#                extends the built-in ruby class fixnum and
#                convert numbers into Roman Numerals.
#
############################################################
require 'test/unit'
require_relative 'roman'

class TestRoman < Test::Unit::TestCase

  def test_ones
    assert_equal( "I", 1.to_roman, "Testing 1")
    assert_equal("II", 2.to_roman, "Testing 2")
    assert_equal("III", 3.to_roman, "Testing 3")
    assert_equal("IV", 4.to_roman, "Testing 4")
    assert_equal("V", 5.to_roman, "Testing 5")
    assert_equal("VI", 6.to_roman, "Testing 6")
    assert_equal("VII", 7.to_roman, "Testing 7")
    assert_equal("VIII", 8.to_roman, "Testing 8")
    assert_equal("IX", 9.to_roman, "Testing 9")
  end

  def test_tens
    assert_equal("X", 10.to_roman, "Testing 10")
    assert_equal("XI", 11.to_roman, "Testing 11")
    assert_equal("XII", 12.to_roman, "Testing 12")
    assert_equal("XIII", 13.to_roman, "Testing 13")
    assert_equal("XIV", 14.to_roman, "Testing 14")
    assert_equal("XV", 15.to_roman, "Testing 15")
    assert_equal("XVI", 16.to_roman, "Testing 16")
    assert_equal("XVII", 17.to_roman, "Testing 17")
    assert_equal("XVIII", 18.to_roman, "Testing 18")
    assert_equal("IXX", 19.to_roman, "Testing 19")
  end

  def test_twenties
    assert_equal("XX", 20.to_roman, "Testing 20")
    assert_equal("XXI", 21.to_roman, "Testing 21")
    assert_equal("XXII", 22.to_roman, "Testing 22")
    assert_equal("XXIII", 23.to_roman, "Testing 23")
    assert_equal("XXIV", 24.to_roman, "Testing 24")
    assert_equal("XXV", 25.to_roman, "Testing 25")
    assert_equal("XXVI", 26.to_roman, "Testing 26")
    assert_equal("XXVII", 27.to_roman, "Testing 27")
    assert_equal("XXVIII", 28.to_roman, "Testing 28")
    assert_equal("IXXX", 29.to_roman, "Testing 29")
  end

  def test_thirties
    assert_equal("XXX", 30.to_roman, "Testing 30")
    assert_equal("XXXI", 31.to_roman, "Testing 31")
    assert_equal("XXXII", 32.to_roman, "Testing 32")
    assert_equal("XXXIII", 33.to_roman, "Testing 33")
    assert_equal("XXXIV", 34.to_roman, "Testing 34")
    assert_equal("XXXV", 35.to_roman, "Testing 35")
    assert_equal("XXXVI", 36.to_roman, "Testing 36")
    assert_equal("XXXVII", 37.to_roman, "Testing 37")
    assert_equal("XXXVIII", 38.to_roman, "Testing 38")
    assert_equal("IXL", 39.to_roman, "Testing 39")
  end

  def test_forties
    assert_equal("XL", 40.to_roman, "Testing 40")
    assert_equal("XLI", 41.to_roman, "Testing 41")
    assert_equal("XLII", 42.to_roman, "Testing 42")
    assert_equal("XLIII", 43.to_roman, "Testing 43")
    assert_equal("XLIV", 44.to_roman, "Testing 44")
    assert_equal("XLV", 45.to_roman, "Testing 45")
    assert_equal("XLVI", 46.to_roman, "Testing 46")
    assert_equal("XLVII", 47.to_roman, "Testing 47")
    assert_equal("XLVIII", 48.to_roman, "Testing 48")
    assert_equal("IXL", 49.to_roman, "Testing 49")
  end

  def test_fifties
    assert_equal("L", 50.to_roman, "Testing 50")
    assert_equal("LI", 51.to_roman, "Testing 51")
    assert_equal("LII", 52.to_roman, "Testing 52")
    assert_equal("LIII", 53.to_roman, "Testing 53")
    assert_equal("LIV", 54.to_roman, "Testing 54")
    assert_equal("LV", 55.to_roman, "Testing 55")
    assert_equal("LVI", 56.to_roman, "Testing 56")
    assert_equal("LVII", 57.to_roman, "Testing 57")
    assert_equal("LVIII", 58.to_roman, "Testing 58")
    assert_equal("IL", 59.to_roman, "Testing 59")
  end

  def test_sixties
    assert_equal("LX", 60.to_roman, "Testing 60")
    assert_equal("LXI", 61.to_roman, "Testing 61")
    assert_equal("LXII", 62.to_roman, "Testing 62")
    assert_equal("LXIII", 63.to_roman, "Testing 63")
    assert_equal("LXIV", 64.to_roman, "Testing 64")
    assert_equal("LXV", 65.to_roman, "Testing 65")
    assert_equal("LXVI", 66.to_roman, "Testing 66")
    assert_equal("LXVII", 67.to_roman, "Testing 67")
    assert_equal("LXVIII", 68.to_roman, "Testing 68")
    assert_equal("ILX", 69.to_roman, "Testing 69")
  end

  def test_seventies
    assert_equal("LXX", 70.to_roman, "Testing 70")
    assert_equal("LXXI", 71.to_roman, "Testing 71")
    assert_equal("LXXII", 72.to_roman, "Testing 72")
    assert_equal("LXXIII", 73.to_roman, "Testing 73")
    assert_equal("LXXIV", 74.to_roman, "Testing 74")
    assert_equal("LXXV", 75.to_roman, "Testing 75")
    assert_equal("LXXVI", 76.to_roman, "Testing 76")
    assert_equal("LXXVII", 77.to_roman, "Testing 77")
    assert_equal("LXXVIII", 78.to_roman, "Testing 78")
    assert_equal("ILXX", 79.to_roman, "Testing 79")
  end

  def test_eightties
    assert_equal("LXXX", 80.to_roman, "Testing 80")
    assert_equal("LXXXI", 81.to_roman, "Testing 81")
    assert_equal("LXXXII", 82.to_roman, "Testing 82")
    assert_equal("LXXXIII", 83.to_roman, "Testing 83")
    assert_equal("LXXXIV", 84.to_roman, "Testing 84")
    assert_equal("LXXXV", 85.to_roman, "Testing 85")
    assert_equal("LXXXVI", 86.to_roman, "Testing 86")
    assert_equal("LXXXVII", 87.to_roman, "Testing 87")
    assert_equal("LXXXVIII", 88.to_roman, "Testing 88")
    assert_equal("ILXXX", 89.to_roman, "Testing 89")
  end

  def test_nineties
    assert_equal("XC", 90.to_roman, "Testing 90")
    assert_equal("XCI", 91.to_roman, "Testing 91")
    assert_equal("XCII", 92.to_roman, "Testing 92")
    assert_equal("XCIII", 93.to_roman, "Testing 93")
    assert_equal("XCIV", 94.to_roman, "Testing 94")
    assert_equal("XCV", 95.to_roman, "Testing 95")
    assert_equal("XCVI", 96.to_roman, "Testing 96")
    assert_equal("XCVII", 97.to_roman, "Testing 97")
    assert_equal("XCVIII", 98.to_roman, "Testing 98")
    assert_equal("IC", 99.to_roman, "Testing 99")
  end

  def test_one_hundred
    assert_equal("CI", 101.to_roman, "Testing 100")
    assert_equal("CII", 102.to_roman, "Testing 100")
    assert_equal("CIII", 103.to_roman, "Testing 100")
    assert_equal("CIV", 104.to_roman, "Testing 100")
    assert_equal("CV", 105.to_roman, "Testing 100")
    assert_equal("CVI", 106.to_roman, "Testing 100")
    assert_equal("CVII", 107.to_roman, "Testing 100")
    assert_equal("CVIII", 108.to_roman, "Testing 100")
    assert_equal("CIX", 109.to_roman, "Testing 100")

  end


end
