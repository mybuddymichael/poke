module Poke
  # Map reads an ASCII file and coverts it to an object that can be read and
  # manipulated by other program objects.
  class Map

    include Poke::ReadMap

    # Params required at initialization.
    PARAMS_REQUIRED = [:map_file]

    # Creates a Map object.
    #
    # params - A Hash of Symbol options.
    #   :map_file - An ASCII file that represents the Map.
    def initialize(params = {})
      Poke::Params.check_params(params, PARAMS_REQUIRED)

      @map_in_lines = get_array_of_lines_from_file(params[:map_file])
      extract_map_key
    end

    # Finds the Map key, which is in the form of a Hash, assigns in to an
    # instance variable, then deletes the key from the Map Array, along with any
    # blank lines.
    #
    # Returns nothing.
    def extract_map_key
      rx = /\{[^}]+\}/i
      map_key_index = @map_in_lines.index { |i| rx.match i }

      @map_key = eval(@map_in_lines[map_key_index])

      @map_in_lines.delete_at(map_key_index)
      @map_in_lines.delete('')
    end
  end
end
