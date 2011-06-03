class Environment

  attr_reader :tiles, :width, :height, :solid_blocks

  def initialize(window, mapfile, tileset, map_key, solid_blocks)
    @window  = window
    @tileset = Gosu::Image.load_tiles(window, tileset,
                                      32, 32, false)
    @map_key, @solid_blocks = map_key, solid_blocks

    get_lines(mapfile)
    get_width
    get_height
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

  def get_width
    @width = @lines[0].size
  end

  def get_height
    @height = @lines.size
  end

  def map_tiles
    @tiles = @lines

    @height.times do |y|
      line = []
      @width.times do |x|
        @map_key.each do |key, value|
          if @lines[y][x] == key
            line.push(value)
          end
        end
      end
      @tiles[y] = line
    end
  end

end
