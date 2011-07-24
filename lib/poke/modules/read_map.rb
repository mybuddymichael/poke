module ReadMap

  def get_lines(file)
    File.readlines(file).map { |line| line.chomp }
  end

  def get_columns(file)
    lines = File.readlines(file).map { |line| line.chomp }

    width = lines[0].size
    height = lines.size

    columns = Array.new(width, '')

    lines.each do |line|
      width.times do |x|
        columns[x] += line[x]
      end
    end

    columns
  end

  def get_width_for_lines(lines)
    lines[0].size
  end

  def get_height_for_lines(lines)
    lines.size
  end

  def get_width_for_columns(columns)
    columns.size
  end

  def get_height_for_columns(columns)
    columns[0].size
  end

end
