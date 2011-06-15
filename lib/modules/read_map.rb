module ReadMap

  def get_lines(file)
    @lines = File.readlines(file).map { |line| line.chomp }
  end

  def get_width
    @width = @lines[0].size
  end

  def get_height
    @height = @lines.size
  end

end
