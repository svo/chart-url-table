require 'chart_url_table'

RSpec.describe ChartUrlTable do
  it 'should create a chart for the table' do
    parser = double
    column = double
    table = double
    columns = double
    values = double

    allow(parser).to receive(:columns).and_return(columns)
    allow(columns).to receive(:map).and_return(values)
    allow(values).to receive(:find).and_return(column)
    allow(table).to receive(:first_numeric_column).and_return(column)
    allow(column).to receive(:values).and_return(%w[5 4 3 2 1])

    described_class.new(parser).create
  end
end
