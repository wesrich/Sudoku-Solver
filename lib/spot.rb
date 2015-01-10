class Spot
  attr_reader :possible

  def initialize(value = nil)
    @possible = [*value || ("1".."9")]
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
end
