class UndirectedDirections

  attr_accessor :locations

  def initialize
    @locations = []
  end

  def process(input)
    input.each_line do |line|
      matches = line.match(/(\w+) to (\w+) = (\d+)/)
      from, to, dist =  matches[1..3]
      register_distance(from, to, dist)
    end
  end

  def register_distance(from, to, dist)
    from = find_or_create_location(from)
    to = find_or_create_location(to)
    unless from.distance_to(to)
      from.set_distance(to, dist)
      to.set_distance(from, dist)
    end
  end

  def find_or_create_location(name)
    location = @locations.find { |x| x.name == name }

    unless location
      location = Location.new(name)
      locations << location
    end

    location
  end

  def routes
    length = locations.length
    locations.permutation(length).to_a
  end

  def shortest_distance
    distances = []

    routes.each do |route|
      distance = 0

      route.each_cons(2) do |from, to|
        distance += from.distance_to(to)
      end

      distances << distance

    end

    distances.min
  end

end

class Location

  attr_accessor :name, :distances

  def initialize(name)
    @name = name
    @distances = {}
  end

  def set_distance(location, distance)
    distances[location] = distance.to_i
  end

  def distance_to(location)
    distances[location]
  end

end
