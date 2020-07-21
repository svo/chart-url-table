require 'parse/html_parser'
require 'webmock/rspec'

RSpec.describe HtmlParser do
  DOMAIN = 'coconuts.com'.freeze
  URL = "http://#{DOMAIN}/".freeze
  BODY = '<html></html>'.freeze

  context 'Successful request' do
    before(:each) do
      stub_request(:get, DOMAIN).to_return(body: BODY)
      @html_parser = described_class.new(URL)
    end

    it 'should have expected body' do
      expect(@html_parser.response.body).to eq(BODY)
    end
  end
end
