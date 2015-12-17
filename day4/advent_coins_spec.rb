require_relative 'advent_coins'

describe AdventCoins do

  it 'finds the lowest number combined with secret to produce a hash beginnig with 5 0\'s' do
    coins = AdventCoins.new('abcdef')
    expect(coins.lowest_number).to eq 609043
  end

  it 'finds the lowest number combined with secret to produce a hash beginnig with 5 0\'s' do
    coins = AdventCoins.new('pqrstuv')
    expect(coins.lowest_number).to eq 1048970
  end

  it 'finds the lowest number combined with secret to produce a hash beginnig with 5 0\'s' do
    coins = AdventCoins.new('yzbqklnj')
    expect(coins.lowest_number).to eq 282749
  end

  it 'finds the lowest number combined with secret to produce a hash beginnig with 6 0\'s' do
    coins = AdventCoins.new('yzbqklnj', 6)
    expect(coins.lowest_number).to eq 9962624
  end

end
