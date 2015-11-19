# require 'pry'

class Spot
  attr_reader :possible

  def initialize(value = nil)
    @possible = value.to_i.zero? ? ("1".."9").to_a : [value]
    @value = value
  end

  def value(value)
    return false if value.to_i.zero?
    raise "'#{value}' is not in the possible values: #{@possible}" unless @possible.include?(value)
    @value = value
  end

  def inspect
    @value.to_i
  end

  def to_s
    @value.to_s
  end

  def ==(other)
    @value.to_i == other.to_i
  end

  def empty?
    @value.to_i.zero?
  end

  def solvable?
    empty? && @possible.size == 1
  end

  def update_possible(other_spots)
    other_spots.map!(&:to_s).uniq!
    @possible.delete_if { |possible| other_spots.include? possible }
    @value = @possible.first if @possible.size == 1
    !self.empty?
  end
end
