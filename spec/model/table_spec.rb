require 'model/table'

RSpec.describe Table do
  it 'convert arrays into columns' do
    first_column = %w[1 3]
    second_column = %w[2 4]
    expected = [Column.new(first_column), Column.new(second_column)]

    expect(described_class.new([first_column, second_column]).columns).to match_array(expected)
  end
end
