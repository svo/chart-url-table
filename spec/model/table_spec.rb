require 'model/table'

RSpec.describe Table do
  context 'being created' do
    it 'converts arrays into columns' do
      first_column = %w[1 3]
      second_column = %w[2 4]
      expected = [Column.new(first_column), Column.new(second_column)]

      expect(described_class.new([first_column, second_column]).columns).to match_array(expected)
    end
  end

  context 'when asked for numeric column' do
    it 'returns the first one' do
      first_column = %w[bob 3]
      second_column = %w[2 4]
      expected = Column.new(second_column)

      expect(described_class.new([first_column, second_column]).first_numeric_column).to eq(expected)
    end

    it 'should raise error if none found' do
      first_column = %w[bob 3]
      second_column = %w[2 test]

      expect do
        described_class.new([first_column, second_column]).first_numeric_column
      end.to raise_error('No numeric column in table')
    end
  end
end
