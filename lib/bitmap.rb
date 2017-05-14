class Bitmap

  def initialize(m, n)
    @pixels = Array.new(m) { Array.new(n, 0) }
  end

  def get_pixels()
    return @pixels
  end

  def set_pixel(positions, colour)
    if (@pixels[positions.first - 1][positions.last -  1] rescue false)
      @pixels[positions.first - 1][positions.last -  1] = colour  
    end
  end

  def delete_pixels()
    @pixels.each do |pixel_row|
      pixel_row.fill(0)
    end
  end

  def set_vertical_segment(column, ranges, colour)
    range_start = ranges.first - 1
    range_end = ranges.last - 1
    for i in (range_start..range_end)
      if (@pixels[i][column - 1] rescue false)
        @pixels[i][column - 1] = colour
      end
    end
  end

  def set_horizontal_segment(row, ranges, colour)
    range_start = ranges.first - 1
    range_end = ranges.last - 1
    for j in (range_start..range_end)
      if (@pixels[row - 1][j] rescue false)
        @pixels[row - 1][j] = colour
      end
    end
  end

end