class Grid

  attr_reader :map

  def initialize(window, user, mapfile, tileset, map_key)
    @window, @user = window, user
    @map = Map.new(window, mapfile, tileset, map_key)
  end

  def draw
    @map.draw
  end

  def width
    @map.width
  end

  def height
    @map.height
  end

  def solid_blocks
    @map.solid_blocks
  end

  def lines
    @map.lines
  end

end
