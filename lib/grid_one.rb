class GridOne < Grid

  attr_reader :program_1

  def initialize
    super
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
