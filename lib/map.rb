class Map

  def initialize(window, mapfile)
    @window = window
    @tileset = Gosu::Image.load_tiles(window, 'media/32x32diagonal_lines.png',
                                      32, 32, false)

    get_lines(mapfile)
    get_map_width
    get_map_height
  end

  private

  def get_lines(file)
    @lines = File.readlines(file).map { |line| line.chomp }
  end

  def get_map_width
    @width = @lines[0].size
  end

  def get_map_height
    @height = @lines.size
  end

end
