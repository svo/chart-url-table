require 'model/table'
require 'graph/graph_image'

class ChartUrlTable
  def initialize(parser)
    @parser = parser
  end

  def create
    table = Table.new(@parser.columns)
    GraphImage.new(table.first_numeric_column).create
    'Open result.png'
  end
end
