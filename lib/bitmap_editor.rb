require_relative "../lib/bitmap"

class BitmapEditor
  attr_reader :bitmap

  def initialize
    @bitmap = Bitmap.new
  end

  def create_image(args)
    if args.length != 2
      puts "Wrong number of arguments" 
      return
    elsif not args.all? { |arg| Integer(arg).is_a?(Integer) rescue false }
      puts "Wrong argument type, please supply only integers" 
      return
    elsif not args.all? { |arg| (1..250).include?(arg.to_i) } 
      puts "Bitmap size not in range. Please supply a number between 1 and 250"  
      return
    end
    args = args.map { |arg| arg.to_i }
    bitmap.init_pixels(args.first, args.last)
  end

  def colour_pixel(args)
    if args.length != 3
      puts "Wrong number of arguments" 
      return
    elsif not args.take(2).all? { |arg| Integer(arg).is_a?(Integer) rescue false }
      puts "Wrong argument type, please supply only integers for coordinates"  
      return
    elsif not ("A".."Z").include?(args.last)
      puts "Wrong argument type, please supply only capital letters for colour"  
      return
    end
    positions = args.take(2).map { |arg| arg.to_i }
    bitmap.set_pixel(positions, args.last)
  end
  
  def draw_vertical(args)
    if args.length != 4
      puts "Wrong number of arguments"  
      return
    elsif not args.take(3).all? { |arg| Integer(arg).is_a?(Integer) rescue false }
      puts "Wrong argument type, please supply only integers for coordinates" 
      return
    elsif not ("A".."Z").include?(args.last)
      puts "Wrong argument type, please supply only capital letters for colour" 
      return
    end
    indices = args.take(3).map { |arg| arg.to_i }
    column = indices.first
    ranges = indices.last(2)
    colour = args.last
    bitmap.set_vertical_segment(column, ranges, colour)
  end

  def draw_horizontal(args)
    if args.length != 4
      puts "Wrong number of arguments"
      return
    elsif not args.take(3).all? { |arg| Integer(arg).is_a?(Integer) rescue false}
      puts "Wrong argument type, please supply only integers for coordinates" 
      return
    elsif not ("A".."Z").include?(args.last)
      puts "Wrong argument type, please supply only capital letters for colour" 
      return
    end
    indices = args.take(3).map { |arg| arg.to_i }
    row = indices.first
    ranges = indices.last(2)
    colour = args.last
    bitmap.set_horizontal_segment(row, ranges, colour)
  end

  def clear_image
    bitmap.delete_pixels
  end

  def show_image
    bitmap.print_pixels
  end

end
