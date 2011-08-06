require_relative "test_helper"

class TestProgramMap < Poke::Test

  def setup
    @program_map =
      Poke::ProgramMap.new(map_file: 'media/grid_one/program_map.txt')
  end

  test "creates an array of path rectangle coordinates" do
    a = @program_map.find_each_path_rectangle
    e = [[[1, 1], [3, 3]], [[4, 12], [7, 14]], [[8, 23], [10, 25]]]

    assert_equal(e, a)
  end

end

