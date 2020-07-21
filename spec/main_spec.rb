require 'main'
require 'chart_url_table'
require 'webmock/rspec'

RSpec.describe Main do
  DOMAIN_NAME = 'coconuts.com'.freeze
  REQUEST_URL = "http://#{DOMAIN_NAME}/".freeze
  DUMMY_BODY = <<-HTML.freeze
    <html>
      <table id="coconuts">
        <tr><td>1</td><td>2</td></tr>
        <tr><td>3</td><td>4</td></tr>
        <tr><td>5</td><td>6</td></tr>
      </table>
      <table id="bob">
      </table>
    </html>
  HTML

  RESULT = <<~TABLE.freeze
    Open result.png
  TABLE

  it 'prints output' do
    output = StringIO.new
    main = Main.new(output, REQUEST_URL)

    stub_request(:get, DOMAIN_NAME).to_return(body: DUMMY_BODY)

    main.run

    expect(output.string).to eq(RESULT)
  end
end
