require_relative 'test_helper'

class TestMap < MiniTest::Unit::TestCase

  def setup
    @window = Window.new
    @map_file = <<-eos
      V....g...V
      V....g...V
      {'.'=>0, 'V'=>1, 'g'=>2}
    eos

    @map = Map.new(window: @window, map_file: @map_file, tileset: nil)
  end

  def test_extract_map_key_produces_a_hash
    assert_equal({'.'=>0, 'V'=>1, 'g'=>2},
                 @map.instance_variable_get(:@map_key))
  end

end

