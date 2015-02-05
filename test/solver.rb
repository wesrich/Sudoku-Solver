describe Solver do
  def setup
    @solver = Solver.new
  end

  it "solves the puzzle" do
    skip "NYI"
    file_name = Dir.entries('./puzzles/').sample
    puzzle = File.read("./puzzles/#{file_name}")
    known_solution = File.read("./solutions/#{file_name}")

    solution = @solver.solve(puzzle)

    assert_equal known_solution, solution
  end
end
