module ReadMap

  # Creates an array of strings corresponding to the lines of the file passed in
  # as an argument.
  #
  # file - A String containing the path to the file to be converted.
  #
  # Examples
  #
  #   get_array_of_lines_from_file("map.txt")
  #   # => ["VV..gg", "..VVgg", "..VV.."]
  #
  # Returns an Array of Strings.
  def get_array_of_lines_from_file(file)
    File.readlines(file).map { |line| line.chomp }
  end

  # Creates an array of strings corresponding to the columns of the file passed
  # in as an argument. Useful for traversing a map using X-then-Y notation.
  # e.g. @map_in_columns[x][y]
  #
  # file - A String containing the path to the file to be converted.
  #
  # Examples
  #
  #   get_array_of_columns_from_file("map.txt")
  #   # => ["V..", "V..", ".VV", ".VV", "gg.", "gg."]
  #
  # Returns an Array of Strings.
  def get_array_of_columns_from_file(file)
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
