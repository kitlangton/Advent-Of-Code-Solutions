class LookAndSay

  attr_accessor :value

  def initialize(start)
    @value = start
  end

  def next_string
    string = ""
    new_value = Array.new
    last_char = nil
    position = -1

    value.each_char do |char|
      if last_char != char
        string << new_value.map(&:to_s).join
        new_value = []
        new_value << 1
        new_value << char.to_i
        last_char = char
        position += 1
      else
      new_value[-2] += 1
      end
    end

    string << new_value.map(&:to_s).join

    @value = string
  end

  def next
    new_value = Array.new
    last_char = nil
    position = -1

    value.each_char do |char|
      if last_char != char
        new_value << 1
        new_value << char.to_i
        last_char = char
        position += 1
      else
      new_value[-2] += 1
      end
    end

    @value = new_value.map(&:to_s).join
  end

end
