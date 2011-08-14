module Poke
  # Map reads an ASCII file and coverts it to an object that can be read and
  # manipulated by other program objects.
  class Map

    # Params required at initialization.
    PARAMS_REQUIRED = [:map_file]

    # Creates a Map object.
    #
    # params - A Hash of Symbol options.
    #   :map_file - An ASCII file that represents the Map.
    def initialize(params = {})
      Poke::Params.check_params(params, PARAMS_REQUIRED)

      @map_in_lines = get_array_of_lines_from_file(params[:map_file])

      extract_map_image_key
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

    # Iterates over each individual character in an array of lines, performing the
    # passed block on each element.
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
      get_height_for_lines(lines).times do |y|
        get_width_for_lines(lines).times do |x|
          yield(y, x)
        end
      end
    end

  end
end
