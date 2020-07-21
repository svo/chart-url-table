require 'parse/html_parser'
require 'webmock/rspec'

RSpec.describe HtmlParser do
  DOMAIN = 'coconuts.com'.freeze
  URL = "http://#{DOMAIN}/".freeze
  ID_FIRST_TABLE = 'coconuts'.freeze
  BODY = <<-HTML.freeze
    <html>
      <table id="#{ID_FIRST_TABLE}">
        <tr><td>1</td><td>2</td></tr>
        <tr><td>3</td><td>4</td></tr>
      </table>
      <table id="bob">
      </table>
    </html>
  HTML

  context 'successful request' do
    before(:each) do
      stub_request(:get, DOMAIN).to_return(body: BODY)
      @html_parser = described_class.new(URL)
    end

    it 'should get first table from body' do
      expect(@html_parser.table.attr('id')).to eq(ID_FIRST_TABLE)
    end

    it 'should get rows from table' do
      expect(@html_parser.rows).to match_array([%w[1 2], %w[3 4]])
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
