class Grid

  def initialize(radius)
    @coordinate_grid = Array.new(radius) { Array.new(radius) { false } }
  end

  def to_s
    output = ""

    @coordinate_grid.each do |row|
      row.each do |col|
        output << (!!col ? "0" : ".") + " "
      end
      output << "\n"
    end

    output
  end

  def each_coord(from,to)
    from_x, from_y = from
    to_x, to_y = to
    (from_x..to_x).each do |row|
      (from_y..to_y).each do |col|
        @coordinate_grid[row][col] = yield(@coordinate_grid[row][col])
      end
    end
  end

  def toggle(from,to)
    each_coord(from,to) do |light|
      !light
    end
  end

  def run_instructions(instructions)
    instructions.each_line do |instruction|
      method = nil
      args = []

      instruction.scan(/turn on|turn off|toggle/) do |match|
        method = match.split(" ").join("_")
      end

      instruction.scan(/\d+,\d+/) do |match|
        args << match.split(',').map(&:to_i)
      end

      self.send(method.to_sym, *args)
    end
  end

  def turn_off(from,to)
    each_coord(from,to) { false }
  end

  def turn_on(from,to)
    each_coord(from,to) { true }
  end

  def size
    all_lights.count
  end

  def all_lights
    @coordinate_grid.flatten
  end

  def off_lights
    all_lights.select { |light| light == false }
  end

  def on_lights
    all_lights.select { |light| light == true }
  end

end

class BrightnessGrid

  def initialize(radius)
    @coordinate_grid = Array.new(radius) { Array.new(radius) { 0 } }
  end

  def to_s
    output = ""

    @coordinate_grid.each do |row|
      row.each do |col|
        output << (!!col ? "0" : ".") + " "
      end
      output << "\n"
    end

    output
  end

  def each_coord(from,to)
    from_x, from_y = from
    to_x, to_y = to
    (from_x..to_x).each do |row|
      (from_y..to_y).each do |col|
        @coordinate_grid[row][col] = yield(@coordinate_grid[row][col])
      end
    end
  end

  def total_brightness
    all_lights.inject(:+)
  end

  def toggle(from,to)
    each_coord(from,to) do |light|
      light + 2
    end
  end

  def run_instructions(instructions)
    instructions.each_line do |instruction|
      method = nil
      args = []

      instruction.scan(/turn on|turn off|toggle/) do |match|
        method = match.split(" ").join("_")
      end

      instruction.scan(/\d+,\d+/) do |match|
        args << match.split(',').map(&:to_i)
      end

      self.send(method.to_sym, *args)
    end
  end

  def turn_off(from,to)
    each_coord(from,to) { |light| light == 0 ? light : light - 1 }
  end

  def turn_on(from,to)
    each_coord(from,to) { |light| light + 1  }
  end

  def size
    all_lights.count
  end

  def all_lights
    @coordinate_grid.flatten
  end

  def off_lights
    all_lights.select { |light| light == false }
  end

  def on_lights
    all_lights.select { |light| light == true }
  end

end
