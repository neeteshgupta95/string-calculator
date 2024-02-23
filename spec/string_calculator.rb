RSpec.describe '#add' do
  it 'returns 0 for an empty string' do
    expect(add('')).to be_an(Integer)
    expect(add('')).to eq(0)
  end

  it 'returns the number for single digit' do
    expect(add('1')).to eq(1)
    expect(add('5')).to eq(5)
  end

  context 'verify the sum of numbers' do
    it 'returns the sum of two numbers' do
      expect(add('1,5')).to eq(6)
      expect(add('2,3')).to eq(5)
    end

    it 'returns the sum of multiple numbers' do
      expect(add('3,2,1,5,6')).to eq(17)
    end

    it 'returns the sum of the numbers when input contains new line' do
      expect(add("1\n2,3")).to eq(6)
    end

    it 'should support different delimiters' do
      expect(add("//;\n1;2")).to eq(3)
      expect(add("//:\n5:6")).to eq(11)
      expect(add("//*\n3*4")).to eq(7)
    end
  end

  it 'should raise error when input is not valid' do
    expect { add("1,\n") }.to raise_error(ArgumentError)
    expect { add("\n,4") }.to raise_error(ArgumentError)
  end
end

# String Calculator method
def add(str)
  raise ArgumentError if str.match(/\n,|,\n/)
  return 0 if str.empty?

  delimiter = ','
  delimiter, str = [str[2], str[4..-1]] if str.start_with?('//')

  str.split(/[,\n#{delimiter}]/).inject(0) { |sum, num| sum + num.to_i }
end
