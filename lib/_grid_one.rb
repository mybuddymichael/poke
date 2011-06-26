class GridOne < Grid

  attr_reader :program_1

  def initialize(window, user)
    super(window, user,
         'media/grid_one.txt',
         'media/grid_one_tileset.png',
        {'.'=>0, 'V'=>1, 'g'=>2})

    @program_1 = Program.new(@window, 416, 160,
                             'media/grid_one_program_1_path.txt')
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
