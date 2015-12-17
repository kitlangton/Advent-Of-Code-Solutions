require 'digest'


class AdventCoins

  def initialize(salt, num_zeroes = 5)
    @salt = salt
    @num_zeroes = num_zeroes
  end

  def lowest_number
    i = 0
    loop do
      test = @salt + i.to_s
      if valid?(digest(test))
        return i
      end
      i += 1
    end
  end

  def valid?(hash)
    zeroes = "0" * @num_zeroes
    hash[0...@num_zeroes] == zeroes
  end

  def digest(input)
    md5 = Digest::MD5.new
    md5.hexdigest(input)
  end

end
