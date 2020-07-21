require 'net/http'
require 'nokogiri'
require 'httparty'

class HtmlParser
  def initialize(uri)
    @uri = uri
    @response = HTTParty.get(@uri)

    raise "Failed request to #{@uri}" unless @response.ok?
  end

  def table
    table = Nokogiri::HTML(@response.body).at('table')

    raise "No table on #{@uri}" if table.nil?

    table
  end

  def rows
    table.search('tr').map { |row| row.search('td').map(&:text) }
  end

  def columns
    rows.transpose
  end
end
