class Player

  attr_reader :x, :y, :direction

  def initialize(args)
    @window, @x, @y = args[:window], args[:x], args[:y]

    @facing_left, @facing_right, @facing_down, @facing_up =
      Gosu::Image.load_tiles(@window, 'media/player.png', 32, 32, false)
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
    @current_image.draw(@x, @y, ZOrder::Player)
  end

  private

  def get_current_direction
    @direction = @window.buttons_pushed.last unless movement_is_locked?
  end

  def move
    case @direction
    when :up
      @current_image = @facing_up
      @y -= @movement_factor unless next_block_is_solid?
    when :down
      @current_image = @facing_down
      @y += @movement_factor unless next_block_is_solid?
    when :left
      @current_image = @facing_left
      @x -= @movement_factor unless next_block_is_solid?
    when :right
      @current_image = @facing_right
      @x += @movement_factor unless next_block_is_solid?
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

  def next_block_is_solid?
    unless movement_is_locked?
      solid_blocks = @window.current_map.solid_blocks
      maptiles     = @window.current_map.lines

      x_tile, y_tile = @x/32, @y/32
      x_tc = (@tile_coefficients[@direction][1])
      y_tc = (@tile_coefficients[@direction][0])

      solid_blocks.include?(maptiles[y_tile+y_tc][x_tile+x_tc])
    end
  end

end
