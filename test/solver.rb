describe Solver do
  def setup
    @solver = Solver.new
  end

  describe "Puzzle 1" do
    def setup
      super
      @num = 1
      puzzle = File.read("./puzzles/puzzle_#{@num}.sudoku")
      @solution = @solver.solve(puzzle)
    end

    it "loads correct rows" do
      assert_equal [8,0,0,5,0,4,0,0,7], @solver.send(:row, 1)
      assert_equal [0,9,0,7,0,1,0,6,0], @solver.send(:row, 3)
      assert_equal [0,3,0,9,0,2,0,8,0], @solver.send(:row, 7)
    end

    it "solves the first puzzle" do
      skip "NYI"
      known_solution = File.read("./solutions/puzzle_#{@num}.sudoku")
      assert_equal known_solution, @solution
    end
  end
end
