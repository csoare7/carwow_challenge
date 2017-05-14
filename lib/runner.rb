require_relative "../lib/bitmap_editor"

module Runner

  @@help_txt = 
  ```
    There are 8 supported commands:

    I M N - Create a new M x N image with all pixels coloured white (O).
    C - Clears the table, setting all pixels to white (O).
    L X Y C - Colours the pixel (X,Y) with colour C.
    V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    S - Show the contents of the current image
    ? - Displays help text
    X - Terminate the session
  ```

  def initialise()
    @bitmap_editor = BitmapEditor.new()
  end

  def execute(cmd, args*)
    case cmd
    when "I"
      @bitmap_editor.create_image(args*)
    when "C"
      @bitmap_editor.clear_image(args*)
    when "L"
      @bitmap_editor.colour_pixel(args*)
    when "V"
      @bitmap_editor.draw_vertical(args*)
    when "H"
      @bitmap_editor.draw_horizontal(args*)
    when "S"
      @bitmap_editor.show_image()
    when "?"
      show_help()
    when "X"
      quit()
    else
      puts "Input not valid command. Type ? for help"
    end
  end

  def quit()
    exit(0)
  end

  def help()
    puts @@help_txt
  end
end