module ReadFile

  def get_line(file)
    @lines = File.readlines(file).map { |line| line.chomp }
  end

  def get_width
    @width = @lines[0].size
  end

  def get_height
    @height = @lines.size
  end

end
