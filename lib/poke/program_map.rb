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

      @map_in_lines = get_array_of_lines_from_file(params[:map_file])
    end

    # Parses a map array for the upper-left and lower-right corners of each
    # separate path rectangle in the map. This indicates a new NPC and a new
    # path.
    #
    #   find_each_path_rectangle
    #   # => [[[1, 1], [3, 3]], [[4, 12], [7, 14]], [[8, 23], [10, 25]]]
    #
    # @api private
    #
    # @return [Array] An array of array elements, each element containing the
    #   coordinates (in y,x notation) of the upper-left and lower-right corners
    #   of each path.
    def find_each_path_rectangle
      paths = []

      iterate_over_each_character_in_array_of_lines(@map_in_lines) do |y, x|
        c = @map_in_lines[y][x]

        next if c == '.'

        if above(y, x) == '.' and left(y, x) == '.'
          paths.push([])
          paths.last.push([y,x])

          until below(y, x) == '.' and left(y, x) == '.'
            y += 1
          end

          until below(y, x) == '.' and right(y, x) == '.'
            x += 1
          end

          paths.last.push([y, x])
        end
      end

      paths
    end

    # Parses the map array for any 'N' character and attaches its position to
    # the appropriate path array.
    #
    # @return [Array] An array of array elements, each element containing the
    #   coordinates (in y,x notation) of the upper-left and lower-right corners
    #   of each path, along with the starting position of each NPC.
    def attach_npc_positions_to_path_arrays
      paths = find_each_path_rectangle

      iterate_over_each_character_in_array_of_lines(@map_in_lines) do |y, x|
        c = @map_in_lines[y][x]

        next if c == '.' or c == 'p'

        if c == 'N'
          paths.each do |e|
            if y >= e[0][0] and y <= e[1][0]
              if x >= e[0][1] and x <= e[1][1]
                e.push([y, x])
              end
            end
          end
        end
      end

      @paths = paths
    end

  private

    def above(y, x)
      @map_in_lines[y-1][x]
    end

    def below(y, x)
      @map_in_lines[y+1][x]
    end

    def left(y, x)
      @map_in_lines[y][x-1]
    end

    def right(y, x)
      @map_in_lines[y][x+1]
    end

  end

end
