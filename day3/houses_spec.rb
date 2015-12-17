require_relative 'houses'

describe Houses do

  it 'delivers a present to the initial house' do
    houses = Houses.new
    houses.deliver('')

    expect(houses.total_houses).to eq 1
    expect(houses.total_deliveries).to eq 1
  end

  it 'delivers a present to each visited house' do
    houses = Houses.new
    houses.deliver('<')

    expect(houses.total_houses).to eq 2
    expect(houses.total_deliveries).to eq 2
  end

  it 'delivers presents to multiple houses' do
    houses = Houses.new
    houses.deliver('^>v<')

    expect(houses.total_houses).to eq 4
    expect(houses.total_deliveries).to eq 5
  end

  it 'delivers lots of presents to 2 houses' do
    houses = Houses.new
    houses.deliver('^v^v^v^v^v')

    expect(houses.total_houses).to eq 2
    expect(houses.total_deliveries).to eq 11
  end

  it 'deliver many presents to a shitload of houses' do
    input = File.read('input.txt')
    houses = Houses.new
    houses.deliver(input)

    expect(houses.total_houses).to eq 2572
    expect(houses.total_deliveries).to eq 8193
  end
end

describe RoboHouses do
  it 'deliver many presents to a shitload of houses' do
    houses = RoboHouses.new
    houses.deliver('^v')

    expect(houses.total_houses).to eq 3
    expect(houses.total_deliveries).to eq 4
  end

  it 'deliver many presents to a shitload of houses' do
    houses = RoboHouses.new
    houses.deliver('^>v<')

    expect(houses.total_houses).to eq 3
    expect(houses.total_deliveries).to eq 6
  end

  it 'deliver many presents to a shitload of houses' do
    houses = RoboHouses.new
    houses.deliver('^v^v^v^v^v')

    expect(houses.total_houses).to eq 11
    expect(houses.total_deliveries).to eq 12
  end

  it 'deliver many presents to a shitload of houses' do
    input = File.read('input.txt')
    houses = RoboHouses.new
    houses.deliver(input)

    expect(houses.total_houses).to eq 2631
    expect(houses.total_deliveries).to eq 8192
  end

end
