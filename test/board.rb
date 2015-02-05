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
end
