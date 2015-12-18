require_relative 'santapass'

describe Santapass do
	it 'increments a string to the next string' do
    expect(Santapass.next('zz')).to eq 'aaa'
  end

  describe '#contains_straight?' do
    it 'rejects without a straight' do
      expect(Santapass.contains_straight?('abd')).to eq false
    end

    it 'accepts strings with a straight' do
      expect(Santapass.contains_straight?('abc')).to eq true
    end
  end

  describe '#no_iol?' do
    it 'rejects strings which contain the letters i, o, or l' do
      expect(Santapass.no_iol?('hi')).to eq false
    end

    it 'accepts strings which do not contain the letters i, o, or l' do
      expect(Santapass.no_iol?('game')).to eq true
    end
  end

  describe '#has_two_pairs?' do
    it 'accepts strings that contain two different non overlapping pairs of letters' do
      expect(Santapass.has_two_pairs?('hhapapapahh')).to eq true
    end

    it 'rejects strings that do not contain two different non overlapping pairs of letters' do
      expect(Santapass.has_two_pairs?('hhhacacac')).to eq false
    end
  end

  describe 'valid?' do
    it 'checks whether or not the string is a valid password' do
      expect(Santapass.valid?('hijklmmn')).to eq false
      expect(Santapass.valid?('abbceffg')).to eq false
      expect(Santapass.valid?('abbcegjk')).to eq false
      # expect(Santapass.valid?('ghjaabcc')).to eq true

    end
  end

  describe '#next_valid' do
    it 'returns the next valid password from the given string' do
      expect(Santapass.next_valid('abcdefgh')).to eq 'abcdffaa'
      expect(Santapass.next_valid('ghijklmn')).to eq 'ghjaabcc'
      expect(Santapass.next_valid('hepxxyzz')).to eq 'ghjaabcc'
    end
  end

end
