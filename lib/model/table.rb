class Table
  attr_reader :columns

  def initialize(columns)
    @columns = columns.map { |column| Column.new(column) }
  end
end
