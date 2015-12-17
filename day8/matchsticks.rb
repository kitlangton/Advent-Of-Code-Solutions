class Matchsticks
  def string_data_length(string)
    string = string.chomp
    result = eval(string)
    result.length
  end

  def encoded_length(string)
    string = string.chomp
    string.inspect.length
  end

  def code_length(string)
    string = string.to_s.chomp
    count = 0
    string.each_char do |char|
      count += 1
    end
    count
  end

  def total_code(list)
    total = 0
    list.each_line do |line|
      total += code_length(line)
    end
    total
  end

  def total_encode(list)
    total = 0
    list.each_line do |line|
      total += encoded_length(line)
    end
    total
  end

  def total_string(list)
    total = 0
    list.each_line do |line|
      total += string_data_length(line)
    end
    total
  end

  def total(list)
    total_code(list) - total_string(list)
  end

  def new_total(list)
    total_encode(list) - total_code(list)
  end

end
