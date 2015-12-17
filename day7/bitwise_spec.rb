require_relative 'bitwise'

describe Bitwise do

  describe 'read' do
    it 'interprets string input' do
      bitwise = Bitwise.new
      bitwise.read('123 -> x')
      expect(bitwise.wires.count).to eq 1
      expect(bitwise.wires[0].output).to eq 123
    end

    it 'creates bitwise gates'  do
      bitwise = Bitwise.new
      bitwise.read('123 -> x')
      bitwise.read('456 -> y')
      bitwise.read('x AND y -> z')
      expect(bitwise.wires.count).to eq 3
      expect(bitwise.find_wire('z').output).to eq 72
    end

    it 'interprets multiple lines' do
      bitwise = Bitwise.new
      instructions = "18 -> x\nx -> y"
      bitwise.read_lines(instructions)
      expect(bitwise.wires.count).to eq 2
      expect(bitwise.find_wire('y').output).to eq 18
    end

    it 'interprets multiple lines' do
      bitwise = Bitwise.new
      instructions = "18 -> x\nx -> y"
      bitwise.read_lines(instructions)
      expect(bitwise.wires.count).to eq 2
      expect(bitwise.find_wire('y').output).to eq 18
    end

    it 'interprets complicated multiple lines' do
      bitwise = Bitwise.new
      instructions = <<-EOF.chomp
123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
EOF
      bitwise.read_lines(instructions)
      expect(bitwise.wires.count).to eq 8
      expect(bitwise.find_wire('d').output).to eq 72
      expect(bitwise.find_wire('e').output).to eq 507
      expect(bitwise.find_wire('f').output).to eq 492
      expect(bitwise.find_wire('g').output).to eq 114
      expect(bitwise.find_wire('h').output).to eq 65412
      expect(bitwise.find_wire('i').output).to eq 65079
      expect(bitwise.find_wire('x').output).to eq 123
      expect(bitwise.find_wire('y').output).to eq 456
    end

    it 'reads the advent instructions' do
      bitwise = Bitwise.new
      instructions = File.read('input.txt')
      bitwise.read_lines(instructions)
      expect(bitwise.find_wire('a').output).to eq 956
    end

  end
end


describe Wire do
  it 'has an identifier' do
    wire = Wire.new(:a)
    expect(wire.name).to eq :a
  end

  it 'can be provided input' do
    wire = Wire.new(:a)
    wire.provide(128)
    expect(wire.output).to eq 128
  end

  it 'one wires value can be fed to another' do
    wire = Wire.new(:a)
    wire2 = Wire.new(:a)
    wire.provide(10)
    wire2.provide(wire)
    wire.provide(128)
    expect(wire2.output).to eq 128
  end
end

describe Gate do
  it 'returns the value for two inputs based for AND gates' do
    wire = Wire.new('a')
    wire2 = Wire.new('b')
    wire.provide(123)
    wire2.provide(456)
    gate = ANDGate.new(wire, wire2)
    expect(gate.output).to eq 72
  end

  it 'returns the value for two inputs based for OR gates' do
    wire = Wire.new('a')
    wire2 = Wire.new('b')
    wire.provide(123)
    wire2.provide(456)
    gate = ORGate.new(wire, wire2)
    expect(gate.output).to eq 507
  end

  it 'returns the value for two inputs based for LSHIFT' do
    wire = Wire.new('a')
    wire2 = Wire.new('b')
    wire.provide(123)
    wire2.provide(2)
    gate = LSHIFTGate.new(wire, wire2)
    expect(gate.output).to eq 492
  end

  it 'returns the value for two inputs based for RSHIFT' do
    wire = Wire.new('a')
    wire2 = Wire.new('b')
    wire.provide(456)
    wire2.provide(2)
    gate = RSHIFTGate.new(wire, wire2)
    expect(gate.output).to eq 114
  end

  it 'returns the value for two inputs based for NOT' do
    wire = Wire.new('a')
    wire.provide(123)
    gate = NOTGate.new(wire)
    expect(gate.output).to eq 65412
  end
end
