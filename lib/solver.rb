require_relative 'spot'

class Solver
  def initialize
    @board = Array.new(9) { [] }
    @loaded = false
  end

  def board
    @board.map { |line| line.join('') }.join("\n")
  end

  def solve(puzzle)
    load_board(puzzle)
    board
  end

  private

  def load_board(input)
    return if @loaded
    input.split("\n").each_with_index do |line, row|
      9.times { |num| @board[row] << Spot.new(line[num].to_i) }
    end
    @loaded = true
  end

  def row(num)
    @board[num-1]
  end

  def col(num)
    @board.map { |row| row[num-1] }
  end
end
