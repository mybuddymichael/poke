module ReadMap

  def get_lines(file)
    if file.class == String
      file.split("\n")
    else
      File.readlines(file).map { |line| line.chomp }
    end
  end

  def get_columns(file)
    lines = get_lines(file)

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
