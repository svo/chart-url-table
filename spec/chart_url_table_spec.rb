require "chart_url_table"

RSpec.describe ChartUrlTable do
  let(:chart_url_table) {described_class.new}

  it "should have a lovely bunch of coconuts" do
    expect(chart_url_table.coconuts).to eq("lovely bunch of coconuts")
  end
end

