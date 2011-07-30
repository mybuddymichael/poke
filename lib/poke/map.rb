require 'rmagick'

class Map

  include ReadMap

  PARAMS_REQUIRED = [:window, :map_file, :tileset]

  attr_reader :map_in_lines, :tiles, :width, :height, :solid_blocks

  def initialize(params = {})
    Params.check_params(params, PARAMS_REQUIRED)

    @window = params[:window]

    @map_file = params[:map_file]

    @tileset = Magick::Image.read("media/grid_one/tileset.png")
    @number_of_tiles = @tileset[0].columns/32

    @map_in_lines = get_array_of_lines_from_file(@map_file)

    @map_key = extract_map_key
    @solid_blocks = get_array_of_solid_blocks

    @width  = get_width_for_lines(@map_in_lines)
    @height = get_height_for_lines(@map_in_lines)

    @image_list = get_image_list_array_by_processing_map_file

    split_tileset_into_individual_tiles

    create_full_map_image
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

  def get_image_list_array_by_processing_map_file
    image_list = []

    @height.times do |y|
      @width.times do |x|
        @map_key.each do |key, value|
          if @map_in_lines[y][x] == key
            image_list.push("media/tmp/tile#{value}.png")
          end
        end
      end
    end

    image_list
  end

  def split_tileset_into_individual_tiles
    @number_of_tiles.times do |i|
      image = @tileset[0].crop((i*32), 0, 32, 32)
      image.write("media/tmp/tile#{i}.png")
    end
  end

  def create_full_map_image
    `montage #{@image_list.join(" ")} -tile #{@width}x -geometry 32x32+0+0 media/grid_one/full_map_image.png`
    @full_map_image = Gosu::Image.new(@window, "media/grid_one/full_map_image.png", false)
  end

end
