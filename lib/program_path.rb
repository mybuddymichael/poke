class ProgramPath

  include ReadMap

  def initialize(pathfile)
    get_lines(pathfile)
  end

end
