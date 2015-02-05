require_relative 'spot'
require_relative 'board'

class Solver
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def solve(puzzle = nil)
    @board.load_board(puzzle)
    @board.find_possible_values
    @board
  end
end
