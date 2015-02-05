describe Board do
  def setup
    solver = Solver.new
    puzzle = File.read("./puzzles/puzzle_1.sudoku")
    solver.send(:load_board, puzzle)
    @board = solver.board
  end

  it "outputs the board" do
    assert @board
  end

  it "loads correct rows" do
    skip "NYI"
    assert_equal [8,0,0,5,0,4,0,0,7], @solver.send(:row, 1)
    assert_equal [0,9,0,7,0,1,0,6,0], @solver.send(:row, 3)
    assert_equal [2,0,7,8,1,3,6,0,4], @solver.send(:row, 6)
    assert_equal [0,3,0,9,0,2,0,8,0], @solver.send(:row, 7)
  end

  it "loads correct columns" do
    skip "NYI"
    assert_equal [8,0,0,1,0,2,0,0,6], @solver.send(:col, 1)
    assert_equal [5,0,7,0,0,8,9,0,3], @solver.send(:col, 4)
    assert_equal [4,0,1,0,0,3,2,0,5], @solver.send(:col, 6)
  end
end
