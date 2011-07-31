require_relative "test_helper"

class TestReadMap < Poke::Test

  def setup
    @object = Object.new
    @object.extend(ReadMap)
    @mf = "media/grid_one/map.txt"
    @pmf = "media/grid_one/program_map.txt"
    @lines = @object.get_array_of_lines_from_file(@pmf)
    @columns = @object.get_array_of_columns_from_file(@pmf)
  end

  test "creates an array of lines" do
    assert_equal(Array, @object.get_array_of_lines_from_file(@mf).class)
  end

  test "creates an array of columns" do
    assert_equal(Array, @object.get_array_of_columns_from_file(@mf).class)
  end

  test "can get the width of a lines array" do
    assert_equal(27, @object.get_width_for_lines(@lines))
  end

  test "can get the height of a lines array" do
    assert_equal(12, @object.get_height_for_lines(@lines))
  end

end
