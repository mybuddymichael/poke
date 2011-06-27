class Map

  include ReadMap

  attr_reader :lines, :tiles, :width, :height, :solid_blocks, :map_key

  def initialize(window, mapfile, tileset, map_key)
    @tileset = Gosu::Image.load_tiles(window, tileset,
                                      32, 32, false)
    get_solid_blocks

    get_lines(mapfile)
    extract_map_key
    get_width
    get_height
    map_tiles
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[y][x]
        if tile
          @tileset[tile].draw(x * 32, y * 32, ZOrder::Map)
        end
      end
    end
  end

  private

  def extract_map_key
    map_break = @lines.index('')
    map_key = map_break+1
    @map_key = eval(@lines[map_key])

    @lines.delete_at(map_break)
    @lines.delete_at(map_key)
  end

  def get_solid_blocks
    @solid_blocks = []

    @map_key.each_key do |key|
      if (key.upcase == key) and (key != '.')
        @solid_blocks.push(key)
      end
    end
  end

  def map_tiles
    @tiles = []

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
