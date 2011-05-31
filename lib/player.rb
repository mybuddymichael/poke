class Player

  attr_reader :x, :y, :direction

  def initialize(window, name, x, y)
    @window, @name, @x, @y, = window, name, x, y

    @facing_right, @facing_up, @facing_left, @facing_down =
      Gosu::Image.load_tiles(window, 'media/arrows.png', 32, 32, false)
    @current_image = @facing_down

    @movement_factor = 2
    @position_range  = {xmin: 0, xmax: 480-32, ymin: 0, ymax: 320-32}.freeze
  end

  def update
    # Grab the current direction, or ignore it if locked
    get_current_direction

    # Move in the current direction.
    move

    # If the player position is off the screen, move him just inside
    keep_player_in_window

    # Continue in the same direction until on a square again
    lock_direction_unless_square
  end

  def draw
    @current_image.draw(@x, @y, ZOrder::Player)
  end

  private

  def get_current_direction
    @direction = @window.buttons_pushed.last unless locked?
  end

  def move
    case @direction
    when :up
      @current_image = @facing_up
      @y -= @movement_factor unless solid?
    when :down
      @current_image = @facing_down
      @y += @movement_factor unless solid?
    when :left
      @current_image = @facing_left
      @x -= @movement_factor unless solid?
    when :right
      @current_image = @facing_right
      @x += @movement_factor unless solid?
    else
      continue_movement_if_locked
    end
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def locked?
    @locked
  end

  def lock_direction_unless_square
    unless (@x%32 == 0) and (@y%32 == 0)
      lock
    else
      unlock
    end
  end

  def continue_movement_if_locked
    if locked?
      case @current_image
      when @facing_up    then @y -= @movement_factor
      when @facing_down  then @y += @movement_factor
      when @facing_left  then @x -= @movement_factor
      when @facing_right then @x += @movement_factor
      end
    end
  end

  def keep_player_in_window
    if @x < @position_range[:xmin] then @x = @position_range[:xmin] end
    if @x > @position_range[:xmax] then @x = @position_range[:xmax] end
    if @y < @position_range[:ymin] then @y = @position_range[:ymin] end
    if @y > @position_range[:ymax] then @y = @position_range[:ymax] end
  end

  def solid?
    unless locked?
      x_cell, y_cell = @x/32, @y/32

      case @direction
      when :up
        @window.map.tiles[y_cell-1][x_cell] == 0
      when :down
        @window.map.tiles[y_cell+1][x_cell] == 0
      when :left
        @window.map.tiles[y_cell][x_cell-1] == 0
      when :right
        @window.map.tiles[y_cell][x_cell+1] == 0
      end
    end
  end

end
