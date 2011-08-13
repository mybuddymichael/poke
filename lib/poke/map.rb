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

  end
end
