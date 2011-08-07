require_relative 'test_helper'

class TestProgramMap < Poke::Test

  # Finds the upper-left corner of each path
  # Finds the lower-right corner of each path
  # Creates an array of each path's coordinates
  #   [[[1, 1], [3, 3]], [[4, 5], [6, 8]]... etc
  # Initializes Programs for each indicated character

  def setup
    @program_map =
      Poke::ProgramMap.new(map_file: 'media/grid_one/program_map.txt')
  end

  test "creates an array of path rectangle coordinates" do
    a = @program_map.find_each_path_rectangle
    e = [[[3, 1], [5, 3]], [[4, 12], [7, 14]], [[8, 23], [10, 25]]]

    assert_equal(e, a)
  end

end

