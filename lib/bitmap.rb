class Bitmap

  def initialize(m, n)
    @pixels = Array.new(m) { Array.new(n) { 0 } }
  end

  def get_pixels()
    return @pixels
  end

  def delete_pixels()
    @pixels.each do |pixel_row|
      pixel_row.map { |pixel| 0 }
    end
  end

end