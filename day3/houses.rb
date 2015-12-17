class Houses

  def initialize
    @houses = Hash.new { |h,k| h[k] = 0 }
    @position = [0,0]
  end

  def deliver(instructions)
    give_present
    instructions.each_char do |direction|
      move(direction)
      give_present
    end
  end

  def move(direction)
    x, y = @position

    case direction
    when '<' then @position = [x - 1, y]
    when '>' then @position = [x + 1, y]
    when '^' then @position = [x, y + 1]
    when 'v' then @position = [x, y - 1]
    end
  end

  def give_present
    @houses[@position] += 1
  end

  def total_houses
    @houses.size
  end

  def total_deliveries
    @houses.values.inject(:+)
  end

end

class Santa
  def initialize
    @position = [0,0]
  end

  def move(direction)
    x, y = @position

    case direction
    when '<' then @position = [x - 1, y]
    when '>' then @position = [x + 1, y]
    when '^' then @position = [x, y + 1]
    when 'v' then @position = [x, y - 1]
    end
  end

  def give_present(houses)
    houses[@position] += 1
  end

end

class RoboHouses
  def initialize
    @houses = Hash.new { |h,k| h[k] = 0 }
    @santas = [Santa.new, Santa.new]
  end

  def deliver(instructions)

    @santas.each { |santa| santa.give_present(@houses) }

    instructions.each_char.with_index do |direction, i|
      current_santa = @santas[i % 2]
      current_santa.move(direction)
      current_santa.give_present(@houses)
    end

  end

  def total_houses
    @houses.size
  end

  def total_deliveries
    @houses.values.inject(:+)
  end

end
