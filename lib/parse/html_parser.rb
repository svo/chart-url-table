require 'net/http'
require 'nokogiri'
require 'httparty'

class HtmlParser
  attr_reader :table

  def initialize(uri)
    response = HTTParty.get(uri)
    raise "Failed request to #{uri}" unless response.ok?

    @table = Nokogiri::HTML(response.body).at('table')
  end
end
