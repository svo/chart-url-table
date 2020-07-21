class Column
  def initialize(values)
    @values = values
  end

  def numeric?
    @values.all? { |value| value.is_a? Numeric or numeric_strings?(value) }
  end

  private

  def numeric_strings?(value)
    !Float(value).nil?
  rescue ArgumentError
    false
  end
end
