require 'model/column'

class Table
  attr_reader :columns

  def initialize(columns)
    @columns = columns.map { |column| Column.new(column) }
  end

  def first_numeric_column
    column = @columns.find(&:numeric?)

    raise 'No numeric column in table' if column.nil?

    column
  end
end
