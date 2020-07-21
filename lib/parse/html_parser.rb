require 'httparty'
require 'net/http'
require 'nokogiri'

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
    table.search('tr').map do |row|
      row.search('td').map do |cell|
        cell.text.gsub(/[[:space:]]/, ' ')
      end
    end.keep_if(&:any?)
  end

  def columns
    rows.transpose
  end
end
