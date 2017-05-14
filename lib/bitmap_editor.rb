require_relative "../lib/bitmap"

class BitmapEditor

  def initialize()

  end

  def create_image(args)
    if args.length != 2
      puts "Wrong number of arguments when initializing bitmap" and return
    elsif not args.all? { |arg| Integer(arg).is_a?(Integer) }
      puts "Wrong argument type, please supply only integers" and return
    elsif not args.all? { |arg| (1..250).include?(arg.to_i) } 
      puts "Bitmap size not in range. Please supply a number between 1 and 250" and return
    end
    args = args.map { |arg| arg.to_i }
    @bitmap = Bitmap.new(args.first, args.last)
  end

  def colour_pixel(args)
    if args.length != 3
      puts "Wrong number of arguments when initializing bitmap" and return
    elsif not args.take(2).all? { |arg| Integer(arg).is_a?(Integer) }
      puts "Wrong argument type, please supply only integers" and return
    elsif not ("A".."Z").include?(args.last)
      puts "Wrong argument type, please supply only capital letters" and return
    end
    positions = args.take(2).map { |arg| arg.to_i }
    @bitmap.set_pixel(positions, args.last)
  end
  
  def clear_image()
    @bitmap.delete_pixels()
  end


  def draw_vertical(args)

  end

  def draw_horizontal(args)
 
  end

  def show_image()
    pixels = @bitmap.get_pixels()
    pixels.each do |pixel_row|
      puts pixel_row.each { |pixel| pixel }.join(" ")
    end
  end

end
