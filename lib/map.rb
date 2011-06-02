class Map
  attr_reader :tiles, :width, :height

  def initialize(window, mapfile, tileset)
    @window = window
    @tileset = Gosu::Image.load_tiles(window, tileset,
                                      32, 32, false)

    get_lines(mapfile)
    get_map_width
    get_map_height
    map_tiles
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[y][x]
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
    @tiles = @lines

    @height.times do |y|
      line = []
      @width.times do |x|
        case @lines[y][x,1]
        when 'v'
          line.push(0)
        when 'g'
          line.push(1)
        else
          line.push(nil)
        end
      end
      @tiles[y] = line
    end
  end

end
