class Window < Gosu::Window

  attr_reader :buttons_pushed, :current_map, :player, :npc1

  def initialize
    super(480, 320, false)
    self.caption = 'Poke'
    @width, @height = 480, 320

    @camera_x = @camera_y = 0

    @paused = false

    @background   = Gosu::Image.new(self, 'media/background.png', false)

    @world_one    = Map.new(self, 'media/map.txt', 'media/tileset.png',
                            {'V'=>0, 'g'=>1, '.'=>nil})
    @current_map  = @world_one
    @player       = Player.new(self, 416, 288)
    @coordinates  = Coordinates.new(self, @player)
    @pause_screen = PauseScreen.new(self, @width, @height)

    @npc1         = NPC.new(self, 416, 160)

    @buttons_pushed = []
  end

  private

  def update
    unless @paused
      @player.update
      @npc1.update
      @coordinates.update
      @camera_x = [[@player.x - 224, 0].max, @current_map.width * 32 - 480].min
      @camera_y = [[@player.y - 160, 0].max, @current_map.height * 32 - 320].min
    end
  end

  def draw
    @background.draw(0, 0, ZOrder::Background)
    translate(-@camera_x, -@camera_y) do
      @current_map.draw
      @player.draw
      @npc1.draw
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
