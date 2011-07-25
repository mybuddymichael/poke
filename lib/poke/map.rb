class Map

  include ReadMap

  PARAMS_REQUIRED = [:window, :map_file, :tileset]

  attr_reader :map_in_lines, :tiles, :width, :height, :solid_blocks, :map_key

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
    @map_file = params[:map_file]
    @tileset = Gosu::Image.load_tiles(params[:window], params[:tileset],
                                      32, 32, false)

    @map_in_lines = get_lines(@map_file)

    @map_key = extract_map_key
    @solid_blocks = get_solid_blocks

    @width  = get_width_for_lines(@map_in_lines)
    @height = get_height_for_lines(@map_in_lines)

    map_tiles
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[y][x]
        if tile
          @tileset[tile].draw(x * 32, y * 32, ZOrder::MAP)
        end
      end
    end
  end

  private

  def extract_map_key
    map_break = @map_in_lines.index('')
    if map_break.nil?
      raise IndexError, "There's no map break in #{@map_file}"
    end

    map_key_location = map_break + 1

    map_key = eval(@map_in_lines[map_key_location])

    @map_in_lines.delete_at(map_key_location)
    @map_in_lines.delete_at(map_break)

    map_key
  end

  def get_solid_blocks
    solid_blocks = []

    @map_key.each_key do |key|
      if (key.upcase == key) and (key != '.')
        solid_blocks.push(key)
      end
    end

    solid_blocks
  end

  def map_tiles
    @tiles = []

    @height.times do |y|
      line = []
      @width.times do |x|
        @map_key.each do |key, value|
          if @map_in_lines[y][x] == key
            line.push(value)
          end
        end
      end
      @tiles[y] = line
    end
  end

end
