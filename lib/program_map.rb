class ProgramMap

  include ReadMap

  attr_reader :lines

  def initialize(pathfile)
    get_lines(pathfile)
    get_width
    get_height
  end

  private

  def get_paths
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == ('p' or 's') and @lines[y][x-1] == '.'
          start_path(x, y)
        end
      end
    end
  end

  def start_path(x, y)
    @boundary[:up => y, :left => x]
  end

end
