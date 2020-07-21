require 'net/http'
require 'nokogiri'
require 'httparty'

class HtmlParser
  def initialize(uri)
    @response = HTTParty.get(uri)
    raise "Failed request to #{uri}" unless @response.ok?
  end

  def table
    Nokogiri::HTML(@response.body).at('table')
  end

  def rows
    table.search('tr').map { |row| row.search('td').map(&:text) }
  end

  def columns
    rows.transpose
  end
end
