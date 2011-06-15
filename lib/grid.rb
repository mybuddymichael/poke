class Grid

  attr_reader :map, :background

  def initialize(window, user, mapfile, tileset, map_key, background)
    @window, @user = window, user
    @map = Map.new(window, mapfile, tileset, map_key)
    @background  = Gosu::Image.new(window, background, false)
  end

  def update
    @map.update
  end

  def draw
    @map.draw
  end

  def start
    @window.set_current_grid_as(self)
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
