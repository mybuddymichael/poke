require_relative "test_helper"

class TestProgramMap < Poke::Test

  def setup
    @program_map =
      Poke::ProgramMap.new(map_file: 'media/grid_one/program_map.txt')
  end

end

