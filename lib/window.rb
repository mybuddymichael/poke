class Window < Gosu::Window

  attr_reader :buttons_pushed, :map

  def initialize
    super(480, 320, false)
    self.caption = 'Poke'

    @window_width, @window_height = 480, 320
    @camera_x = @camera_y = 0

    @map          = Map.new(self, 'media/map.txt')
    @player       = Player.new(self, 'Ferd', 224, 128)
    @coordinates  = Coordinates.new(self, @player)
    @pause_screen = PauseScreen.new(self, @window_width, @window_height)

    @grid = Gosu::Image.new(self, 'media/32x32grid.png', false)

    # Create an array to keep track of the controls
    @buttons_pushed = []
  end

  def update
    unless @paused
      @player.update
      @coordinates.update
      @camera_x = [[@player.x - 240, 0].max, @map.width * 32 - 480].min
      @camera_y = [[@player.y - 160, 0].max, @map.height * 32 - 320].min
    end
  end

  def draw
    draw_rect(@window_width, @window_height,
              Color::White, ZOrder::Background)
    translate(-@camera_x, -@camera_y) do
      @map.draw
      #@grid.draw(0,0,ZOrder::Grid)
      @player.draw
    end
    @coordinates.draw
    if @paused
      @pause_screen.draw
    end
  end

  def button_down(id)
    case id
    when Gosu::KbUp     then @buttons_pushed.push(:up)
    when Gosu::KbDown   then @buttons_pushed.push(:down)
    when Gosu::KbLeft   then @buttons_pushed.push(:left)
    when Gosu::KbRight  then @buttons_pushed.push(:right)
    when Gosu::KbEscape then toggle_pause
    when Gosu::KbQ      then close if @paused
    end
  end

  def button_up(id)
    case id
    when Gosu::KbUp    then @buttons_pushed.delete(:up)
    when Gosu::KbDown  then @buttons_pushed.delete(:down)
    when Gosu::KbLeft  then @buttons_pushed.delete(:left)
    when Gosu::KbRight then @buttons_pushed.delete(:right)
    end
  end

  def toggle_pause
    if @paused
      @paused = false
    else
      @paused = true
    end
  end

  def draw_rect(width, height, color, z_order)
    # Draws a rectangle by coordinates clockwise from top-left
    draw_quad(0, 0, color, width, 0, color, width, height, color,
              0, height, color, z_order, :default)
  end

end
