require_relative "test_helper"

class TestReadMap < Poke::Test

  def setup
    @object = Object.new
    @object.extend(Poke::ReadMap)
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

  test "can get the width of a columns array" do
    assert_equal(27, @object.get_width_for_columns(@columns))
  end

  test "can get the height of a columns array" do
    assert_equal(12, @object.get_height_for_columns(@columns))
  end

  test "iterates over each character in a lines array" do
    c = @object.get_width_for_lines(@lines)*@object.get_height_for_lines(@lines)
    n = 0

    @object.iterate_over_each_character_in_array_of_lines(@lines) do |y, x|
      n += 1 if @lines[y][x]
    end

    assert_equal(c, n)
  end

end
