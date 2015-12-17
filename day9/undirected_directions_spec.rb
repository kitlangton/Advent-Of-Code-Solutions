require_relative 'undirected_directions'

describe UndirectedDirections do

  it 'processes input' do
    directions = UndirectedDirections.new
    input = File.read('example.txt')

    directions.process(input)

    expect(directions.locations.size).to eq 3
  end

  it 'calculates the number of possible routes' do
    directions = UndirectedDirections.new
    input = File.read('example.txt')

    directions.process(input)

    expect(directions.routes.size).to eq 6
  end

  it 'calculates the shortest route given a set of directions' do
    directions = UndirectedDirections.new
    input = File.read('example.txt')

    directions.process(input)

    expect(directions.shortest_distance).to eq 605
  end

  it 'calculates the shortest route given a set of advent directions' do
    directions = UndirectedDirections.new
    input = File.read('input.txt')

    directions.process(input)

    expect(directions.shortest_distance).to eq 117
  end

end

describe Location do

  it 'has a name' do
    loc = Location.new('Albequerque')

    expect(loc.name).to eq 'Albequerque'
  end

  it 'has takes a distance to another place' do
    loc = Location.new('Albequerque')
    loc2 = Location.new('New York')

    loc.set_distance(loc2, 500)

    expect(loc.distance_to(loc2)).to eq 500
  end

end
