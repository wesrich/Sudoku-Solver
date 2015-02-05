describe Solver do
  def setup
    @solver = Solver.new
  end

  describe "Puzzle 1" do
    def setup
      super
      @num = 1
      puzzle = File.read("./puzzles/puzzle_#{@num}.sudoku")
      @solver.send(:load_board, puzzle)
    end

    it "loads correct rows" do
      skip "Reimplementing"
      assert_equal [8,0,0,5,0,4,0,0,7], @solver.send(:row, 1)
      assert_equal [0,9,0,7,0,1,0,6,0], @solver.send(:row, 3)
      assert_equal [2,0,7,8,1,3,6,0,4], @solver.send(:row, 6)
      assert_equal [0,3,0,9,0,2,0,8,0], @solver.send(:row, 7)
    end

    it "loads correct columns" do
      skip "Reimplementing"
      assert_equal [8,0,0,1,0,2,0,0,6], @solver.send(:col, 1)
      assert_equal [5,0,7,0,0,8,9,0,3], @solver.send(:col, 4)
      assert_equal [4,0,1,0,0,3,2,0,5], @solver.send(:col, 6)
    end

    it "solves the first puzzle" do
      skip "NYI"
      board = @solver.board
      solution = @solver.solve
      known_solution = File.read("./solutions/puzzle_#{@num}.sudoku")
      assert_equal board, solution
      assert_equal known_solution, solution
    end
  end

  describe "Puzzle, Last Item" do
    def setup
      super
      @known_solution = File.read("./solutions/puzzle_1.sudoku")
      puzzle = @known_solution.dup
      puzzle[0] = " "
      @solver.send(:load_board, puzzle)
    end

    it "can identify the last square" do
      skip "Reimplementing"
      last_spot = @solver.send(:row, 1)[0]
      assert last_spot.empty?, "Spot isn't empty: #{last_spot}"

      @solver.send(:find_possible_values)
      assert_equal ["8"], last_spot.possible

      solution = @solver.solve
      assert_equal @known_solution, solution
    end
  end
end
