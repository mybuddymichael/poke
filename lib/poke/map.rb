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
      @map_key      = extract_map_key(@map_in_lines)
    end

    # Creates an array of strings corresponding to the lines of the file passed in
    # as an argument. Useful for traversing a map using Y-then-X notation, e.g.
    # @map_in_columns[y][x].
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

  end
end
