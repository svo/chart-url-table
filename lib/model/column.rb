require 'set'

class Column
  def initialize(values)
    @values_array = values
  end

  def numeric?
    @values_array.all? { |value| value.is_a? Numeric or numeric_strings?(value.split.first) }
  end

  def values
    @values_array.map do |value|
      if value.is_a? Numeric
        value
      elsif numeric_strings?(value.split.first)
        Float(value.split.first)
      else
        raise 'bob'
      end
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
