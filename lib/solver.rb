require_relative 'spot'
require_relative 'board'

class Solver
  attr_reader :board

  def initialize
    @board = Board.new
    @loaded = false
  end

  def solve(puzzle = nil)
    load_board(puzzle)
    @board.find_possible_values
    @board
  end

  private

  def load_board(puzzle)
    @board.load_board(puzzle)
  end
end
