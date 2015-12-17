module WrapperPaper
  def self.from_string(dimensions)
    l,w,h = dimensions.split('x').map(&:to_i)
    total_area(l,w,h) + smallest_sides(l,w,h,).inject(:*)
  end

  def self.ribbons_from_string(dimensions)
    l,w,h = dimensions.split('x').map(&:to_i)
    present = smallest_sides(l,w,h).inject(:+) * 2
    bow = l * w * h
    present + bow
  end

  def self.ribbons_from_list(list)
    total = 0
    list.each_line do |dimensions|
      total += ribbons_from_string(dimensions)
    end
    total
  end

  def self.from_list(list)
    total = 0
    list.each_line do |dimensions|
      total += from_string(dimensions)
    end
    total
  end

  def self.smallest_sides(l,w,h)
    [l,w,h].sort.first(2)
  end

  def self.total_area(l,w,h)
    2*l*w + 2*w*h + 2*h*l
  end
end
