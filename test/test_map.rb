require_relative 'test_helper'

class TestMap < Poke::Test

  def setup
    @map = Poke::Map.new(map_file: 'media/grid_one/map.txt')
  end

  test 'extract map key produces a hash' do
    @map_image_key = @map.instance_variable_get(:@map_image_key)
    assert_equal({'.'=>0, 'V'=>1, 'g'=>2}, @map_image_key)
  end

end

