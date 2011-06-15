class GridOne

  attr_reader :map, :user, :program_1, :background

  def initialize(window, user)
    @window, @user = window, user
  end
  
  def start
    @map = Map.new(@window, 'media/grid_one.txt', 'media/grid_one_tileset.png',
                   {'V'=>0, 'g'=>1, '.'=>nil})
    @background  = Gosu::Image.new(@window, 'media/background.png', false)
    @program_1   = Program.new(@window, 416, 160)
  end

  def update
    @program_1.update
  end

  def draw
    @map.draw
    @program_1.draw
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
