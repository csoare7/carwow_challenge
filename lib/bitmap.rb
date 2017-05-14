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

end