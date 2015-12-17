require_relative 'fire_hazard'

describe Grid do

  context 'new grid' do

    it 'initializes with a radius' do
      grid = Grid.new(10)
      expect(grid.size).to eq (100)
    end

    it 'starts with lights off' do
      grid = Grid.new(10)
      expect(grid.off_lights.count).to eq 100
    end

  end

  describe '#turn_on' do
    it 'turns lights on' do
      grid = Grid.new(10)
      grid.turn_on([0,0],[2,2])
      expect(grid.on_lights.count).to eq 9
    end
  end

  describe '#toggle' do
    it 'toggle lights' do
      grid = Grid.new(10)
      grid.toggle([0,0],[2,2])
      grid.toggle([0,0],[1,1])
      expect(grid.on_lights.count).to eq 5
    end
  end

  describe '#turn_off' do
    it 'turns lights off' do
      grid = Grid.new(10)
      grid.turn_on([0,0],[9,9])
      grid.turn_off([3,3],[6,6])
      expect(grid.on_lights.count).to eq 84
    end
  end

  describe '#run_instructions' do
    it 'interprets strings' do
      grid = Grid.new(10)
      instructions = "turn on 00,0 through 9,8"
      grid.run_instructions(instructions)
      expect(grid.on_lights.count).to eq 90
    end
  end

  xit 'reads advent instructions' do
    grid = Grid.new(1000)
    instructions = File.read('input.txt')
    grid.run_instructions(instructions)
    expect(grid.on_lights.count).to eq 377891
  end

  xit 'reads advent instructions' do
    grid = Grid.new(1000)
    instructions = File.read('input.txt')
    grid.run_instructions(instructions)
    expect(grid.on_lights.count).to eq 377891
  end

end
