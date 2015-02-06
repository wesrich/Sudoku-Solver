describe Board do
  def setup
    puzzle = File.read("./puzzles/puzzle_1.sudoku")
    @board = Board.new
    @board.load_board(puzzle)
  end

  it "outputs the board" do
    assert @board
  end

  it "loads correct rows" do
    assert_equal [8,0,0,5,0,4,0,0,7], @board.send(:row, 1)
    assert_equal [0,9,0,7,0,1,0,6,0], @board.send(:row, 3)
    assert_equal [2,0,7,8,1,3,6,0,4], @board.send(:row, 6)
    assert_equal [0,3,0,9,0,2,0,8,0], @board.send(:row, 7)
  end

  it "loads correct columns" do
    assert_equal [8,0,0,1,0,2,0,0,6], @board.send(:col, 1)
    assert_equal [5,0,7,0,0,8,9,0,3], @board.send(:col, 4)
    assert_equal [4,0,1,0,0,3,2,0,5], @board.send(:col, 6)
  end

  it "provides an array for blocks" do
    assert_equal [8,0,0,0,0,5,0,9,0], @board.send(:block, 1)
    assert_equal [5,0,4,0,3,0,7,0,1], @board.send(:block, 2)
    assert_equal [0,0,0,0,0,0,8,1,3], @board.send(:block, 5)
    assert_equal [9,0,2,0,7,0,3,0,5], @board.send(:block, 8)
  end

  describe "Puzzle, Last Item" do
    def setup
      @board = Board.new
      puzzle = File.read("./solutions/puzzle_1.sudoku")
      puzzle[0] = " "
      @board.load_board(puzzle)
      @known_solution = File.read("./solutions/puzzle_1.sudoku").rstrip
    end

    it "can identify the last square" do
      last_spot = @board.send(:row, 1)[0]
      assert last_spot.empty?, "Spot isn't empty: #{last_spot}"

      @board.send(:find_possible_values)
      assert_equal ["8"], last_spot.possible

      assert_equal @known_solution, @board.to_s
    end
  end
end
