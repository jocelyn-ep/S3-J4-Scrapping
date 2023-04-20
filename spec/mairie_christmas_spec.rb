require_relative '../lib/mairie_christmas'

describe 'get_townhall_url_hash method' do
  it 'should return a hash' do
    expect(get_townhall_url_hash).to be_an(Hash)
  end
  it 'should return a hash with at least BTC' do
    expect(get_townhall_url_hash).to include {Avernes}
  end
  it "contains at least 3 values" do 
    get_townhall_url_hash.include?(3) 
  end
end