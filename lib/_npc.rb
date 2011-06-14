class NPC < Player

  def initialize(window, x, y)
    super

    @window, @x, @y, = window, x, y
    @facing_up, @facing_down, @facing_left, @facing_right =
      Gosu::Image.load_tiles(window, 'media/orange_player.png', 32, 38, false)
    @current_image = @facing_down

    @movement_factor = 1
  end

  def get_current_direction
    movement_coefficient = 1800
    movement = rand(movement_coefficient)
    unless movement_is_locked?
      if movement == 0
        @direction = :up
      elsif movement == 1
        @direction = :down
      elsif movement == 2
        @direction = :left
      elsif movement == 3
        @direction = :right
      else
        @direction = nil
      end
    end
  end

end
