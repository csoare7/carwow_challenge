require_relative "../lib/bitmap"

class BitmapEditor

  def initialize()
    @bitmap = Bitmap.new()
  end

  def create_image(*args)
    puts *args
  end

  def clear_image(*args)
    puts *args
  end

  def colour_pixel(*args)
    puts *args   
  end

  def draw_vertical(*args)
    puts *args   
  end

  def draw_horizontal(*args)
    puts *args   
  end

  def show_image()
    puts "Image"
  end
end
