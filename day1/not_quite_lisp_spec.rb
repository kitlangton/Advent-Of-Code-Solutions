require_relative 'not_quite_lisp'

describe SantaFloorCalculator do
  it 'processes serial elevator instructions' do
    final_floor = SantaFloorCalculator.process("(())")
    expect(final_floor).to eq 0
  end

  it 'processes serial elevator instructions' do
    final_floor = SantaFloorCalculator.process("(((")
    expect(final_floor).to eq 3
  end

  it 'processes serial elevator instructions' do
    final_floor = SantaFloorCalculator.process(")())())")
    expect(final_floor).to eq -3
  end

  it 'processes serial elevator instructions' do
    input = File.read('input.txt')
    final_floor = SantaFloorCalculator.process(input)
    expect(final_floor).to eq 232
  end
end
