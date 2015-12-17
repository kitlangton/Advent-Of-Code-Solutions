class NiceStrings
  def judge(string)

    return "naughty" if has_forbidden_string(string)
    return "nice" if has_double_letter(string) && has_three_vowels(string)

    "naughty"
  end

  def count_in_list(list)
    count = 0

    list.each_line do |string|
      count += 1 if judge(string) == "nice"
    end

    count
  end

  def has_forbidden_string(string)
    forbidden_strings = %W{ab cd pq xy}

    string.chars.each_cons(2) do |substring|
      return true if forbidden_strings.include?(substring.join)
    end

    false
  end

  def has_double_letter(string)
    last_char = nil

    string.each_char do |char|
      return true if last_char == char
      last_char = char
    end

    false
  end

  def has_three_vowels(string)
    vowels = %W{a e i o u}

    count = 0

    string.each_char.each do |char|
      count += 1 if vowels.include?(char)
    end

    count >= 3
  end
end



class NewNiceStrings
  def judge(string)

    # return "naughty" if has_forbidden_string(string)
    return "nice" if has_pair_of_doubles(string) && has_letter_sandwich(string)

    "naughty"
  end

  def count_in_list(list)
    count = 0

    list.each_line do |string|
      count += 1 if judge(string) == "nice"
    end

    count
  end

  def has_letter_sandwich(string)
    string.chars.each_cons(3) do |group|
      return true if group[0] == group[2]
    end
    false
  end

  def has_pair_of_doubles(string)
    matches = Hash.new { |h,k| h[k] = 0}
    last_pair = nil

    string.chars.each_cons(2) do |pair|
      if pair == last_pair
        last_pair = nil
        next
      end

      matches[pair] += 1

      last_pair = pair
    end

    matches.values.any? { |value| value > 1 }
  end
end
