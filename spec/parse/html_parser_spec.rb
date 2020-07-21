require 'parse/html_parser'
require 'webmock/rspec'

RSpec.describe HtmlParser do
  DOMAIN = 'coconuts.com'.freeze
  URL = "http://#{DOMAIN}/".freeze
  BODY = '<html></html>'.freeze

  context 'successful request' do
    before(:each) do
      stub_request(:get, DOMAIN).to_return(body: BODY)
      @html_parser = described_class.new(URL)
    end

    it 'should have expected body' do
      expect(@html_parser.response.body).to eq(BODY)
    end
  end

  context 'unsuccessful request' do
    before(:each) do
      stub_request(:get, DOMAIN).to_return(status: 404)
    end

    it 'should raise error' do
      expect { described_class.new(URL) }.to raise_error("Failed request to #{URL}")
    end
  end
end
