require_relative 'lib/solver'

filename = ARGV[0]
puzzle = File.read(filename)
solver = Solver.new
solution = solver.solve(puzzle)
puts solution
