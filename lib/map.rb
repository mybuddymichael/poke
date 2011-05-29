class Map

  def initialize(window, mapfile)
    @window = window
    @tileset = Gosu::Image.load_tiles(window, 'media/32x32diagonal_lines.png',
                                      32, 32, false)

    get_lines(mapfile)
  end

  def get_lines(file)
    @lines = File.readlines(file).map { |line| line.chomp }
  end

end
