require_relative 'no_math'

describe WrapperPaper do
  it 'calculates the wrapping paper required from a set of dimensions' do
    dimensions = "2x3x4"
    expect(WrapperPaper.from_string(dimensions)).to eq 58
  end

  it 'calculates the wrapping paper required from a set of dimensions' do
    dimensions = "1x1x10"
    expect(WrapperPaper.from_string(dimensions)).to eq 43
  end

  it 'calculates for a list of wrapping paper' do
    list = "2x3x4\n1x1x10"
    expect(WrapperPaper.from_list(list)).to eq 58 + 43
  end

  it 'calculates for a list of wrapping paper' do
    list = File.read('input.txt')
    expect(WrapperPaper.from_list(list)).to eq 1606483
  end

  it 'calculates the required ribbon from dimensions' do
    dimensions =  "2x3x4"
    expect(WrapperPaper.ribbons_from_string(dimensions)).to eq 34
  end

  it 'calculates the required ribbon from dimensions' do
    dimensions =  "1x1x10"
    expect(WrapperPaper.ribbons_from_string(dimensions)).to eq 14
  end

  it 'calculates the required ribbon from dimensions' do
    list = File.read('input.txt')
    expect(WrapperPaper.ribbons_from_list(list)).to eq 3842356
  end

end
