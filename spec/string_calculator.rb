RSpec.describe '#add' do
  it 'returns 0 for an empty string' do
    expect(add('')).to be_an(Integer)
    expect(add('')).to eq(0)
  end
end
