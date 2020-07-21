require 'gruff'

class GraphImage
  def initialize(column)
    @column = column
  end

  def create
    g = Gruff::Line.new
    g.data(:values, @column.values)
    g.write('result.png')
  end
end
