require 'model/column'

RSpec.describe Column do
  it 'should report as numeric column if all numbers' do
    expect(described_class.new([1, 2, 3]).numeric?).to eq(true)
  end

  it 'should report as not numeric column if mix of numbers and strings' do
    expect(described_class.new([1, 2, 'coconuts']).numeric?).to eq(false)
  end

  it 'should report as no values as num' do
    expect(described_class.new(%w[1 2 3]).numeric?).to eq(true)
  end
end
