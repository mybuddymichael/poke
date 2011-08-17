module Poke
  module Support
    # Poke::Support::Map provides support methods for reading and processing map
    # files.
    module Map

      extend self

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
end
