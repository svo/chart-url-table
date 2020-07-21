require 'chart_url_table'

RSpec.describe ChartUrlTable do
  it 'should process url' do
    parser = double
    column = double
    columns = [column]

    allow(parser).to receive(:columns).and_return(columns)

    described_class.new(parser)
  end
end
