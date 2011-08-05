module Poke
  # +ProgramMap+ parses a map file and stores it as an Array, which contains
  # paths and initial positions for {Program} instances. It will instantiate the
  # programs as indicated by the map file.
  class ProgramMap

    include Poke::ReadMap

    def initialize
    end

  end

end
