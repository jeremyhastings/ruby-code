require 'test/unit'
require_relative 'puzzle.rb'

class TestPuzzle < Test::Unit::TestCase
  def setup
    @puzzle = Puzzle.new(3, 3)
  end

  def test_init
    assert_equal( @puzzle.class, Puzzle, "Testing the class of the object")
    assert_equal( @puzzle.width, 3, "Testing width")
    assert_equal( @puzzle.height, 3, "Testing height")
  end

  def test_set_puzzle
    assert_equal( @puzzle.set_puzzle("1 2 3 4 5 6 7 8 9 10 11 _"), "They are not equal", "Testing")
    @puzzle.set_puzzle( "1 2 _ 4 5 3 7 8 6")
    assert_equal( @puzzle.get_puzzle, "1 2 _ 4 5 3 7 8 6")
  end

  def test_get_puzzle
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Test get puzzle on 3 x 3")
    @puzzle1 = Puzzle.new(3, 4)
    assert_equal( @puzzle1.get_puzzle, "1 2 3 4 5 6 7 8 9 10 11 _", "Test get puzzle on 3 x 4")
    @puzzle2 = Puzzle.new( 7, 6)
    assert_equal( @puzzle2.get_puzzle,
                  "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 _",
                  "Text get puzzle on 7 x 6")
  end

  def test_move_up
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Initial Configuration")
    @puzzle.move_up
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 _ 7 8 6", "Testing Move Up")
    @puzzle.move_up
    assert_equal( @puzzle.get_puzzle, "1 2 _ 4 5 3 7 8 6", "Testing Move Up")
    @puzzle.move_up
    assert_equal( @puzzle.get_puzzle, "1 2 _ 4 5 3 7 8 6", "Testing Move Up Wall")
  end

  def test_move_down
    @puzzle.move_up
    @puzzle.move_up
    assert_equal( @puzzle.get_puzzle, "1 2 _ 4 5 3 7 8 6", "Testing Initial Move Down Configuration")
    @puzzle.move_down
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 _ 7 8 6", "Testing Move Down")
    @puzzle.move_down
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Testing Move Down")
    @puzzle.move_down
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Testing Move Down Wall")
  end

  def test_move_left
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Initial Configuration")
    @puzzle.move_left
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 _ 8", "Testing Move Left")
    @puzzle.move_left
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 _ 7 8", "Testing Move Left")
    @puzzle.move_left
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 _ 7 8", "Testing Move Left Wall")
  end

  def test_move_right
    @puzzle.move_left
    @puzzle.move_left
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 _ 7 8", "Testing Initial Move Right Configuration")
    @puzzle.move_right
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 _ 8", "Testing Move Right")
    @puzzle.move_right
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Testing Move Right")
    @puzzle.move_right
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Testing Move Right Wall")
  end

  def test_solve
    @puzzle.solve
    assert_equal( @puzzle.get_puzzle, "1 2 3 4 5 6 7 8 _", "Testing Solve")
  end

  def test_scramble
    @puzzle.scramble
    assert_not_equal( "1 2 3 4 5 6 7 8 _", @puzzle.get_puzzle, "Testing Scramble")
    @puzzle.get_puzzle
  end

  def test_to_s
    assert_equal(@puzzle.to_s, "1 2 3\n4 5 6\n7 8 _")
  end
end
