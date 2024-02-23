RSpec.describe '#add' do
  it 'returns 0 for an empty string' do
    expect(add('')).to be_an(Integer)
    expect(add('')).to eq(0)
  end

  it 'returns the number for single digit' do
    expect(add('1')).to eq(1)
    expect(add('5')).to eq(5)
  end

  it 'returns the sum of two' do
    expect(add('1,5')).to eq(6)
    expect(add('2,3')).to eq(5)
  end
end

# String Calculator method
def add(str)
  return 0 if str.empty?
end
