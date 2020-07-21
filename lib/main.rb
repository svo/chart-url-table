require 'chart_url_table'
require 'parse/html_parser'

class Main
  def initialize(output, url)
    @output = output
    @url = url
  end

  def run
    output.puts(chart_url_table.create)
  end

  private

  attr_reader :output

  def chart_url_table
    @chart_url_table ||= ChartUrlTable.new(parser)
  end

  def parser
    @parser ||= HtmlParser.new(@url)
  end
end
