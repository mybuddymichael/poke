class ProgramMap

  include ReadMap

  attr_reader :map_in_columns

  def initialize(pathfile)
    @map_in_columns = get_array_of_columns_from_file(pathfile)
    @width  = get_width_for_columns(@map_in_columns)
    @height = get_height_for_columns(@map_in_columns)
  end

  private

  def get_paths
    @n = 0

    @width.times do |x|
      @x = x

      @height.times do |y|
        @y = y

        if current_cell == "."
          next
        elsif current_cell == ("p" or "s")
          if to_the_left == "." and above == "."
            @n += 1
            mark_upper_left_boundary
          end

          if to_the_left == "." and below == "."
            mark_bottom_left_boundary
          end
        end

      end
    end
  end

  def current_cell
    @map_in_columns[@x][@y]
  end

  def above
    @map_in_columns[@x][@y-1]
  end

  def below
    @map_in_columns[@x][@y+1]
  end

  def to_the_left
    @map_in_columns[@x-1][@y]
  end

  def to_the_right
    @map_in_columns[@x+1][@y]
  end

  def mark_upper_left_boundary
    instance_variable_set("@path_#{@n}", Hash.new)
    path = instance_variable_get("@path_#{@n}")
    path[:left], path[:up] = @x, @y
  end

end
