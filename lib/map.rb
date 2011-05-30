class Map

  def initialize(window, mapfile)
    @window = window
    @tileset = Gosu::Image.load_tiles(window, 'media/32x32diagonal_lines.png',
                                      32, 32, false)

    get_lines(mapfile)
    get_map_width
    get_map_height
    map_tiles
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
          @tileset[tile].draw(x * 32, y * 32, ZOrder::Texture)
        end
      end
    end
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

  def map_tiles
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case @lines[y][x, 1]
        when 'v'
          0
        else
          nil
        end
      end
    end
  end

end
