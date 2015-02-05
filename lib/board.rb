class Board
  def initialize
    @board = Array.new(9) { [] }
    @loaded = false
  end

  def board
    @board.map { |line| line.join('') }.join("\n")
  end

  def load_board(input)
    return if @loaded
    input.split("\n").each_with_index do |line, row_index|
      9.times { |num| @board[row_index] << Spot.new(line[num].to_i) }
    end
    @loaded = true
  end

  # def solve_one_spot
  #   @board.each_with_index do |row, row_index|
  #     row.each_with_index do |spot, col_index|
  #       next unless spot.empty?
  #       return true if spot.simple_check(row + col(col_index+1))
  #     end
  #   end
  #   false
  # end

  private

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

  def block(num)

  end

  # def find_possible_values
  #   find_possible_values if solve_one_spot
  # end
end