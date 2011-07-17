class User

  attr_reader :x, :y, :direction

  def initialize(window, x, y)
    @window, @x, @y = window, x, y

    @facing_up, @facing_down, @facing_left, @facing_right =
      Gosu::Image.load_tiles(window, 'media/player.png', 32, 38, false)
    @current_image = @facing_down

    @tile_coefficients = {up:[-1,0], down:[1,0], left:[0,-1], right:[0,1]}
    @movement_factor = 2
  end

  def update
    get_current_direction
    move
    lock_direction_unless_square
  end

  def draw
    @current_image.draw(@x, @y-8, ZOrder::PLAYER)
  end

  private

  def get_current_direction
    @direction = @window.buttons_pushed.last unless movement_is_locked?
  end

  def move
    case @direction
    when :up
      @current_image = @facing_up
      @y -= @movement_factor unless path_is_blocked?
    when :down
      @current_image = @facing_down
      @y += @movement_factor unless path_is_blocked?
    when :left
      @current_image = @facing_left
      @x -= @movement_factor unless path_is_blocked?
    when :right
      @current_image = @facing_right
      @x += @movement_factor unless path_is_blocked?
    end
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def movement_is_locked?
    @locked
  end

  def lock_direction_unless_square
    unless (@x%32 == 0) and (@y%32 == 0)
      lock
    else
      unlock
    end
  end

  def path_is_blocked?
    next_block_is_solid? or npc?
  end

  def next_block_is_solid?
    unless movement_is_locked?
      solid_blocks = @window.current_grid.solid_blocks
      maptiles     = @window.current_grid.lines

      x_tile, y_tile = @x/32, @y/32
      x_tc = (@tile_coefficients[@direction][1])
      y_tc = (@tile_coefficients[@direction][0])

      solid_blocks.include?(maptiles[y_tile+y_tc][x_tile+x_tc])
    end
  end

  def npc?
    unless movement_is_locked?
      case @direction
      when :up
        (@window.current_grid.program_1.x == @x) and ((@window.current_grid.program_1.y)/32 == (@y/32 - 1))
      when :down
        (@window.current_grid.program_1.x == @x) and ((@window.current_grid.program_1.y)/32 == (@y/32 + 1))
      when :left
        (@window.current_grid.program_1.y == @y) and ((@window.current_grid.program_1.x)/32 == (@x/32 - 1))
      when :right
        (@window.current_grid.program_1.y == @y) and ((@window.current_grid.program_1.x)/32 == (@x/32 + 1))
      end
    end
  end

end
