require_relative 'nice_strings'

describe NiceStrings do

  # it 'words with at least three vowels are nice' do
  #   nice = NiceStrings.new
  #
  #   ['aeiouaeiouaeiou', 'aei', 'xazegov'].each do |string|
  #     expect(nice.judge(string)).to eq "nice"
  #   end
  # end
  #
  # it 'words with double letters are nice' do
  #   nice = NiceStrings.new
  #
  #   ['xx', 'abcdde', 'aabbccdd'].each do |string|
  #     expect(nice.judge(string)).to eq "nice"
  #   end
  # end

  it 'general checks' do
    nice = NiceStrings.new

    test_strings = %W{ugknbfddgicrmopn aaa}
    test_strings.each do |string|
      expect(nice.judge(string)).to eq "nice"
    end

    test_strings = %W{jchzalrnumimnmhp haegwjzuvuyypxyu dvszwmarrgswjxmb}
    test_strings.each do |string|
      puts string
      expect(nice.judge(string)).to eq "naughty"
    end
  end

  it 'tests strings in list' do
    nice = NiceStrings.new

    list = File.read('input.txt')

    expect(nice.count_in_list(list)).to eq 236
  end

  it 'is nice if it has a pair of doubles' do
    nice = NewNiceStrings.new

    test_strings = %W{xyxy aabcdefgaa}
    test_strings.each do |string|
      expect(nice.has_pair_of_doubles(string)).to be true
    end
  end

  it 'is nice if it has a pair of doubles' do
    nice = NewNiceStrings.new

    test_strings = %W{xyxy aabcdefgaa}
    test_strings.each do |string|
      expect(nice.has_pair_of_doubles(string)).to be true
    end
  end

  it 'is nice if it has a pair of doubles' do
    nice = NewNiceStrings.new

    test_strings = %W{xyxy aaa abcdefeghi}
    test_strings.each do |string|
      expect(nice.has_letter_sandwich(string)).to be true
    end
  end

  it 'tests others' do
    nice = NewNiceStrings.new

    test_strings = %W{xxyxx qjhvhtzxzqqjkmpb}

    test_strings.each do |string|
      puts string
      expect(nice.judge(string)).to eq "nice"
    end

    test_strings = %W{ieodomkazucvgmuy uurcxstgmygtbstg aaa}

    test_strings.each do |string|
      expect(nice.judge(string)).to eq "naughty"
    end

  end

  it 'tests lots' do
    nice = NewNiceStrings.new

    list = File.read('input.txt')

    expect(nice.count_in_list(list)).to eq 51
  end

end
