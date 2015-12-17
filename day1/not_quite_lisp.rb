module SantaFloorCalculator
  def self.process(input)
    floor = 0
    basement = nil

    input.each_char.with_index do |instruction, i|
      if instruction == '('
        floor += 1
      elsif instruction == ')'
        floor -= 1
      end

      if floor == -1
        basement ||= i + 1
      end
    end

    puts basement
    floor
  end
end
