class Integer
  def output
    self
  end

  def ones_complement(bits)
    self ^ ((1 << bits) - 1)
  end
end

class Bitwise

  attr_reader :wires

  def initialize
    @wires = []
  end

  def read(string)
    input, output = string.chomp.split(" -> ")

    input = handle_input(input)

    out_wire = find_or_create_wire(output)
    out_wire.provide(input)
  end

  def handle_input(input)
    case input
    when /\A\d+\z/ then input.to_i
    when /\A\w+\z/ then find_wire(input)
    when /AND|OR|SHIFT/ then create_gate(input)
    when /NOT/ then create_gate(input, true)
    end
  end

  def create_gate(input, not_gate = false)
    if not_gate
      type, x = input.split(" ")
      x = find_or_create_wire(x)
      return NOTGate.new(x)
    end

    x, type, y = input.split(" ")
    x = find_or_create_wire(x)
    y = find_or_create_wire(y)

    Object.const_get("#{type}Gate").new(x, y)
  end

  def read_lines(string)
    string.each_line do |line|
      read(line)
    end
  end

  def find_wire(name)
    @wires.find { |wire| wire.name == name}
  end

  def find_or_create_wire(name)
    return name.to_i if name =~ /\A\d+\z/

    wire = find_wire(name)
    if wire
      return wire
    else
      wire = Wire.new(name)
      wires << wire
      wire
    end
  end

end

class NoInput
  def output
    nil
  end
end

class Wire

  attr_accessor :name, :input

  def initialize(name)
    @name = name
    @input = NoInput.new
  end

  # def inspect
  #   "<Wire: #{@name}, Input: #{@input.name if @input.is_a? Wire}>"
  # end

  def provide(input)
    @input = input
  end

  def output
    @output ||= @input.output
    @output
  end

  def to_i
    self
  end
end

class Gate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def output
    NoInput
  end
end

class LSHIFTGate < Gate
  def output
    x.output << y.output
  end
end

class RSHIFTGate < Gate
  def output
    x.output >> y.output
  end
end

class ORGate < Gate
  def output
    x.output | y.output
  end
end

class NOTGate < Gate
  def initialize(x)
    super(x, nil)
  end

  def output
    x.output.ones_complement(16)
  end
end

class ANDGate < Gate
  def output
    x.output & y.output
  end
end
