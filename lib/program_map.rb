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
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == ('p' or 's')
          if @lines[y][x-1] == '.' # => Left boundary.
            if @lines[y-1][x] == '.' # => Upper boundary.
              mark_upper_left_boundary(x, y)
            elsif @lines[y-1][x] == '.' and @lines[y+1][x] == '.'
              # => Upper and lower boundary.
              mark_upper_left_boundary(x, y)
              mark_bottom_left_boundary(x, y)
            elsif @lines[y+1][x] == '.' # => Lower boundary.
              mark_bottom_left_boundary(x,y)
            end
          elsif @lines[y][x+1] == '.' # => Right boundary.
            if @lines[y-1][x] == '.' # => Upper boundary.
              mark_upper_right_boundary(x+1, y)
            end
          end
        end
      end
    end
  end

  def mark_upper_left_boundary(x, y)
    @boundary[up: y, left: x]
  end

  def mark_upper_right_boundary(x, y)
    @boundary[up: y, right: (x+1)]
  end

  def mark_bottom_left_boundary(x, y)
    @boundary[down: (y+1), left: x]
  end

  def mark_bottom_right_boundary(x, y)
    @boundary[down: (y+1), right: (x+1)]
  end

end
