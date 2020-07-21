require 'net/http'
require 'nokogiri'
require 'httparty'

class HtmlParser
  attr_reader :response

  def initialize(uri)
    @response = HTTParty.get(uri)
  end
end
