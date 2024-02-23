RSpec.describe '#add' do
  it 'returns 0 for an empty string' do
    expect(add('')).to be_an(Integer)
    expect(add('')).to eq(0)
  end

  it 'returns the number for single digit' do
    expect(add('1')).to eq(1)
    expect(add('5')).to eq(5)
  end

  it 'returns the sum of two numbers' do
    expect(add('1,5')).to eq(6)
    expect(add('2,3')).to eq(5)
  end

  it 'returns the sum of multiple numbers' do
    expect(add('3,2,1,5,6')).to eq(17)
  end

  it 'returns the sum of the numbers' do
    expect(add("1\n2,3")).to eq(6)
    expect { add("1,\n") }.to raise_error(ArgumentError)
  end
end

# String Calculator method
def add(str)
  raise ArgumentError if str.match(/,\n/)
  return 0 if str.empty?

  str.split(/[,\n]/).inject(0) { |sum, num| sum + num.to_i }
end
