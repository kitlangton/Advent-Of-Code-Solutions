module Santapass

  def self.next(string)
    string.next
  end

  def self.valid?(string)

    return true if contains_straight?(string) &&
      no_iol?(string) &&
      has_two_pairs?(string)
    false
  end

  def self.next_valid(string)
    candidate = string
    count = 0

    loop do
      candidate = self.next(candidate)

      # p candidate if candidate =~ /\Aghjaa/

      unless no_iol?(candidate)
        count += 1
        if count > 50
          candidate.each_char.with_index  do |char, i|
            if char == "i" || char == "o" || char == "l" && i < 5
              candidate = candidate[0...i] + char.next + ("a" * (candidate.length - i - 1))
            end
          end
        end
      else
        count = 0
      end

      return candidate if valid?(candidate)
    end
  end

  def self.contains_straight?(string)
    string.chars.each_cons(3) do |a, b ,c|
      return true if a.ord + 1 == b.ord && b.ord + 1 == c.ord
    end
    false
  end

  def self.no_iol?(string)
    forbidden = %W{ i o l }
    forbidden.each do |taboo|
      string.each_char do |char|
        return false if char == taboo
      end
    end
    true
  end

  def self.has_two_pairs?(string)
    count = 0
    last_char = nil
    last_match_i = nil

    string.each_char.with_index do |char, i|
      if char == last_char && i - 1 != last_match_i
        count += 1
        last_match_i = i
      end
      last_char = char
    end

    count >= 2
  end

end
