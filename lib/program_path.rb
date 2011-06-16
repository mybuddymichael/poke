class ProgramPath

  include ReadMap

  attr_reader :lines

  def initialize(pathfile)
    get_lines(pathfile)
  end

end
