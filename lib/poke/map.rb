require 'rmagick'

class Map

  include ReadMap

  PARAMS_REQUIRED = [:window, :map_file, :tileset]

  attr_reader :map_in_lines, :tiles, :width, :height, :solid_blocks

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)

    @map_file = params[:map_file]

    @map_in_lines = get_lines(@map_file)

    @map_key = extract_map_key
    @solid_blocks = get_array_of_solid_blocks

    @width  = get_width_for_lines(@map_in_lines)
    @height = get_height_for_lines(@map_in_lines)

    map_tiles
  end

  def draw
    @full_map_image.draw(0, 0, ZOrder::MAP)
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

  def get_array_of_solid_blocks
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
