require 'set'

class Column
  attr_reader :values

  def initialize(values)
    @values = values
  end

  def numeric?
    @values.all? { |value| value.is_a? Numeric or numeric_strings?(value) }
  end

  def ==(other)
    return @values.to_set == other.values.to_set if other.respond_to?(:values)
  end

  private

  def numeric_strings?(value)
    !Float(value).nil?
  rescue ArgumentError
    false
  end
end
