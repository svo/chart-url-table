require "chart_url_table"

class Main
  def initialize(output)
    @output = output
  end

  def run
    output.puts(chart_url_table.coconuts)
  end

  private

  attr_reader :output

  def chart_url_table
    @chart_url_table ||= ChartUrlTable.new
  end
end
