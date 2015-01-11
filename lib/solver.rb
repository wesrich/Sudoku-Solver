require_relative 'spot'

class Solver
  def initialize
    @board = Array.new(9) { [] }
    @loaded = false
  end

  def board
    @board.map { |line| line.join('') }.join("\n")
  end

  def solve(puzzle = nil)
    load_board(puzzle)
    find_possible_values
    board
  end

  def next
  end

  private

  def load_board(input)
    return if @loaded
    input.split("\n").each_with_index do |line, row_index|
      9.times { |num| @board[row_index] << Spot.new(line[num].to_i) }
    end
    @loaded = true
  end

  def row(num)
    @board[num-1]
  end

  def rows
    @board
  end

  def col(num)
    @board.map { |row| row[num-1] }
  end

  def cols
    9.times { |num| cols(num) }
  end

  def find_possible_values
    @board.each_with_index do |row, row_index|
      row.each_with_index do |spot, col_index|
        next unless spot.empty?
        spot.simple_check(row + col(col_index+1))
      end
    end
  end
end
