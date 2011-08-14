module Poke
  # Map reads an ASCII file and coverts it to an object that can be read and
  # manipulated by other program objects.
  class Map

    # Params required at initialization.
    PARAMS_REQUIRED = [:window, :map_file, :tile_set]

    # Creates a Map object.
    #
    # params - A Hash of Symbol options.
    #   :map_file - An ASCII file that represents the Map.
    def initialize(params = {})
      Poke::Params.check_params(params, PARAMS_REQUIRED)

      @window = params[:window]
      @map_in_lines = get_array_of_lines_from_file(params[:map_file])
      @tile_set = Magick::Image.read(params[:tile_set])

      extract_map_image_key
      get_background_map
      get_character_map
      create_background_image
    end

  private

    # Creates an array of strings corresponding to the lines of the file passed
    # in as an argument. Useful for traversing a map using Y-then-X notation,
    # e.g. @map_in_columns[y][x].
    #
    # file - A String containing the path to the file to be converted.
    #
    # Examples
    #
    #   get_array_of_lines_from_file("map.txt")
    #   # => ["VV..gg", "..VVgg", "..VV.."]
    #
    # Returns an Array of Strings.
    def get_array_of_lines_from_file(file)
      File.readlines(file).map { |line| line.chomp }
    end

    # Retrieves the map-image key from the Array of lines (@map_in_lines), evals
    # it to create a Hash, then stores that Hash as the @map_image_key ivar.
    # It will delete the line containing the key, along with any blank lines.
    #
    # Returns nothing.
    def extract_map_image_key
      rx = /\{[^}]+\}/i
      map_key_index = @map_in_lines.index { |i| rx.match i }

      @map_image_key = eval(@map_in_lines[map_key_index])

      @map_in_lines.delete_at(map_key_index)
      @map_in_lines.delete('')
    end

    # Reads the Array of lines, fetching every even character and creating an
    # Array that corresponds to the background map.
    #
    # Returns nothing.
    def get_background_map
      background_map = Array.new(@map_in_lines.size, '')
      @maps ||= {}

      iterate_over_each_character_in_array_of_lines(@map_in_lines) do |y, x|
        if x.even?
          background_map[y] += @map_in_lines[y][x]
        end
      end

      @maps[:background] = background_map
    end

    # See #get_background_map.
    #
    # Returns nothing.
    def get_character_map
      character_map = Array.new(@map_in_lines.size, '')
      @maps ||= {}

      iterate_over_each_character_in_array_of_lines(@map_in_lines) do |y, x|
        if x.odd?
          character_map[y] += @map_in_lines[y][x]
        end
      end

      @maps[:characters] = character_map
    end

    # Reads the background map Array and creates a background image which will
    # be drawn by Map#draw.
    #
    # Returns nothing.
    def create_background_image
      split_tile_set_into_tiles

      iterate_over_each_character_in_array_of_lines(@maps[:background]) do |y,x|
        @map_image_key.each do |key, value|
          if @map_in_lines[y][x] == key
            image_list ||= []
            image_list.push("media/tmp/tile#{value}.png")
          end
        end
      end

      montage_cmd = "montage #{image_list.join(' ')} "
      montage_cmd += "-tile #{@maps[:background][0].size}x "
      montage_cmd += "-geometry 32x32+0+0 media/grid_one/full_map_image.png"

      `#{montage_cmd}`

      @background_image = Gosu::Image.new(@window,
                                          'media/grid_one/full_map_image.png',
                                          false)

      FileUtils.rm_r Dir.glob('media/tmp/*')
    end

    # Helper method to split a uniform tile set into separate tiles that can be
    # used by rmagick.
    #
    # Returns nothing.
    def split_tile_set_into_tiles
      number_of_tiles = @tile_set[0].columns/32

      number_of_tiles.times do |i|
        image = @tile_set[0].crop((i*32), 0, 32, 32)
        image.write("media/tmp/tile#{i}.png")
      end
    end

    # Iterates over each individual character in an array of lines, performing
    # the passed block on each element.
    #
    # lines - An Array of Strings, corresponding to lines in a map file.
    #
    # Yields two Fixnum.
    #
    # Examples
    #
    #   iterate_over_each_character_in_array_of_lines(@map_in_lines) do |y, x|
    #     if @map_in_lines[y][x] == "V"
    #       print "V!"
    #     end
    #   end
    #   # => V! V! V! V! V! V! V! V!
    #
    # Returns nothing.
    def iterate_over_each_character_in_array_of_lines(lines)
      lines.size.times do |y|
        lines[0].size.times do |x|
          yield(y, x)
        end
      end
    end

  end
end
