class Solver
  def initialize
    @board = []
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
    return unless @board.empty?
    input.split("\n").each do |line|
      @board << line.delete("\n").split("").map(&:to_i)
    end
  end
end
