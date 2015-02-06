describe Solver do
  def setup
    @solver = Solver.new
  end

  it "solves the puzzle" do
    # file_name = "puzzle_1.sudoku"
    file_name = Dir.entries('./puzzles/').
                    delete_if { |dir| ['.','..'].include?(dir) }.sample
    puzzle = File.read("./puzzles/#{file_name}")
    known_solution = File.read("./solutions/#{file_name}").rstrip

    solution = @solver.solve(puzzle)

    assert_equal known_solution, solution
  end
end
