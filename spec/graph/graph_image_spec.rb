require 'graph/graph_image'

RSpec.describe GraphImage do
  it 'converts arrays into columns' do
    column = double
    values = double
    grapher = double

    allow(column).to receive(:values).and_return(values)
    allow(grapher).to receive(:data).with(:values, values)
    allow(grapher).to receive(:write).with('result.png')

    allow(Gruff::Line).to receive(:new).and_return(grapher)

    described_class.new(column).create
  end
end
