class ProgramPath

  include ReadMap

  attr_reader :lines

  def initialize(pathfile)
    get_lines(pathfile)
    @non_path_blocks = 0
  end

end
