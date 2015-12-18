require_relative 'look_and_say'

describe LookAndSay do
  it 'updates a sequence of numbers based upon the look-and-say pattern' do
    look = LookAndSay.new('211')

    expect(look.next).to eq '1221'
  end

  it 'solves the advent problem' do
    look = LookAndSay.new('1321131112')

    50.times do
      look.next
    end

    length = look.value.length

    # 10.times do
    #   length = length * 1.303577269034296
    # end

    expect(length).to eq 492982
    # 492982
  end
end
