require_relative '../lib/dark_trader'

describe 'scrap_to_hash method' do
  it 'should return a hash' do
    expect(scrap_to_hash).to be_an(Hash)
  end
  it 'should return a hash with at least BTC' do
    expect(scrap_to_hash).to include {BTC}
  end
  it "contains at least 3 values" do 
    scrap_to_hash.include?(3) 
  end
end
