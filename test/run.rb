require 'minitest'
require_relative '../solver.rb'

describe Solver do
  def setup
    @solver = Solver.new
  end

  it "solves the first puzzle" do
    num = 1
    puzzle = File.read('../puzzles/puzzle_#{num}.sudoku')
    solution = @solver.solve(puzzle)
    known_solution = File.read('../solutions/puzzle_#{num}.sudoku')

    assert_equal known_solution, solution
  end
end
