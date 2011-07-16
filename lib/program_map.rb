class ProgramMap

  include ReadMap

  attr_reader :lines

  def initialize(pathfile)
    get_columns(pathfile)
    get_width
    get_height
  end

  private

  def get_paths
    @width.times do |x|

      @x = x

      @height.times do |y|

        @y = y

        next if current_cell == "."

        if @map_in_columns[x][y] == "p"
          if @map_in_columns[x-1][y] == "." and @map_in_columns[x][y-1] == "."
            mark_upper_left_boundary
          elsif @map_in_columns[x+1][y] == "." and @map_in_columns[x][y=1] == "."
            mark_upper_right_boundary
          end

          if @map_in_columns[x-1][y] == "." and @map_in_columns[x][y+1] == "."
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

  def mark_upper_left_boundary(@x, @y)
    @boundary[up: @y, left: @x]
  end

  def mark_upper_right_boundary(@x, @y)
    @boundary[up: @y, right: (@x+1)]
  end

  def mark_bottom_left_boundary(@x, @y)
    @boundary[down: (@y+1), left: @x]
  end

  def mark_bottom_right_boundary(@x, @y)
    @boundary[down: (@y+1), right: (@x+1)]
  end

end
