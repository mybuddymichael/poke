class GridOne < Grid

  attr_reader :program_1

  def initialize(window, user)
    super(window, user, 'media/grid_one.txt',
          'media/grid_one_tileset.png', {'V'=>0, 'g'=>1, '.'=>nil},
          'media/background.png')
    @program_1   = Program.new(@window, 416, 160)
  end

  def update
    super
    @program_1.update
  end

  def draw
    super
    @program_1.draw
  end

end
