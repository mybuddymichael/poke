require_relative 'test_helper'

class TestMap < MiniTest::Unit::TestCase

  def setup
    @window = Window.new
    @map = @window.current_grid.instance_variable_get(:@map)
    @map_key = @map.instance_variable_get(:@map_key)
  end

  def test_extract_map_key_produces_a_hash
    assert_equal({'.'=>0, 'V'=>1, 'g'=>2}, @map_key)
  end

end

