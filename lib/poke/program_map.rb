module Poke
  # +ProgramMap+ parses a map file and stores it as an Array, which contains
  # paths and initial positions for {Program} instances. It will instantiate the
  # programs as indicated by the map file.
  class ProgramMap

    include Poke::ReadMap

    # The parameters required at initialization.
    PARAMS_REQUIRED = [:map_file]

    # Creates a new +ProgramMap+.
    #
    # @param [Hash] params
    # @option params [String] :map_file a String containing the path to the map
    #   file, e.g. "media/map.txt".
    def initialize(params = {})
      Poke::Params.check_params(params, PARAMS_REQUIRED)

      @map_file = params[:map_file]
    end

  end

end
