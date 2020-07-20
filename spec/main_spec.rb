require 'main'
require 'chart_url_table'

RSpec.describe Main do
  let(:chart_url_table) { ChartUrlTable.new }

  it 'prints chart_url_table output' do
    output = StringIO.new
    main = Main.new(output)

    main.run

    expect(output.string).to include(chart_url_table.coconuts)
  end
end
