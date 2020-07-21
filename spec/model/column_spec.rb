require 'model/column'

RSpec.describe Column do
  it 'should report as not numeric column if mix of numbers and strings' do
    expect(described_class.new(%w[1 2 coconuts]).numeric?).to eq(false)
  end

  it 'should report as numeric column if all number strings' do
    expect(described_class.new(%w[1 2 3]).numeric?).to eq(true)
  end

  it 'should report as numeric column if all strings start with number' do
    expect(described_class.new(['1.46 m (4 ft 9 1⁄2 in)', '1.485 m (4 ft 10 1⁄2 in)']).numeric?).to eq(true)
  end

  it 'should report as equal' do
    expect(described_class.new(%w[1 2 3])).to eq(described_class.new(%w[1 2 3]))
  end

  it 'should not report as equal' do
    expect(described_class.new(%w[1 2 3])).not_to eq(described_class.new(%w[2 3]))
  end

  context 'getting values' do
    it 'should return numeric values if all number strings' do
      expect(described_class.new(%w[1 2 3]).values).to match_array([1, 2, 3])
    end

    it 'should return numeric values if all strings start with number' do
      expect(described_class.new(['1.46 m (4 ft 9 1⁄2 in)', '2 coconuts']).values).to match_array([1.46, 2])
    end
  end
end
