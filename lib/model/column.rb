require 'set'

class Column
  def initialize(values)
    @values_array = values.map { |string| string.split.first }
  end

  def numeric?
    @values_array.all? { |value| numeric_strings?(value) }
  end

  def values
    @values_array.map do |value|
      Float(value) if numeric_strings?(value)
    end
  end

  def ==(other)
    return values.to_set == other.values.to_set if other.respond_to?(:values)
  end

  private

  def numeric_strings?(value)
    !Float(value).nil?
  rescue ArgumentError
    false
  end
end
