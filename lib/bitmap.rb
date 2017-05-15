class Bitmap
  attr_accessor :pixels

  def initialize
    @pixels = nil
  end

  def init_pixels(m, n)
    self.pixels = Array.new(m) { Array.new(n, 0) }
  end

  def set_pixel(positions, colour)
    if pixels != nil and pixels[positions.first - 1][positions.last -  1]
      pixels[positions.first - 1][positions.last -  1] = colour  
    end
  end

  def delete_pixels
    if pixels != nil
      pixels.each do |pixel_row|
        pixel_row.fill(0)
      end
    end
  end

  def set_vertical_segment(column, ranges, colour)
    range_start = ranges.first - 1
    range_end = ranges.last - 1
    for i in (range_start..range_end)
      set_pixel([i,column], colour)
    end
  end

  def set_horizontal_segment(row, ranges, colour)
    range_start = ranges.first - 1
    range_end = ranges.last - 1
    for j in (range_start..range_end)
      set_pixel([row,j], colour)
    end
  end

  def print_pixels
    if pixels != nil
      pixels.each do |pixel_row|
        puts pixel_row.join(" ")
      end
    end
  end
end