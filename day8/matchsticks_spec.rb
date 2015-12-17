require_relative 'matchsticks'

describe Matchsticks do
  it 'returns string data length for a string' do
    stick = Matchsticks.new
    line = File.read("test.txt")
    expect(stick.string_data_length(line)).to eq 3
  end

  it 'returns code length for a string' do
    stick = Matchsticks.new
    expect(stick.code_length('""')).to eq 2
    expect(stick.code_length('"aaa\"aaa"')).to eq 10
    expect(stick.code_length('"\x27"')).to eq 6
    expect(stick.code_length('"abc"')).to eq 5
  end

  it 'returns totals for a list' do
    stick = Matchsticks.new
    list = File.read("test2.txt")
    expect(stick.total_code(list)).to eq 23
    expect(stick.total_string(list)).to eq 11
    expect(stick.total(list)).to eq 12
  end

  it 'returns the encoded length' do
    stick = Matchsticks.new
    expect(stick.encoded_length('""')).to eq 6
  end

  it 'returns totals for advent input' do
    stick = Matchsticks.new
    list = File.read("input.txt")
    expect(stick.total(list)).to eq 1342
  end

  it 'returns totals for advent input' do
    stick = Matchsticks.new
    list = File.read("input.txt")
    expect(stick.new_total(list)).to eq 1342
  end
end
