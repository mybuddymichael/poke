class GridOne < Grid

  attr_reader :program_1

  def initialize(window, user)
    super(window, user,
         'media/grid_one/map.txt',
         'media/grid_one/tileset.png',
        {'.'=>0, 'V'=>1, 'g'=>2})

    @program_1 = Program.new(@window, 416, 160,
                             'media/grid_one/program_path_1.txt')
  end

  def update
    @program_1.update
  end

  def draw
    super
    @program_1.draw
  end

end
