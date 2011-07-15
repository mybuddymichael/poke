module ReadMap

  def get_lines(file)
    @lines = File.readlines(file).map { |line| line.chomp }
  end

  def get_columns(file)
    lines = File.readlines(file).map { |line| line.chomp }

    width = lines[0].size
    height = lines.size

    @map_in_columns = Array.new(@width, '')

    lines.each do |line|
      width.times do |x|
        @map_in_columns[x] += line[x]
      end
    end
  end

  def get_width
    @width = @lines[0].size
  end

  def get_height
    @height = @lines.size
  end

end
