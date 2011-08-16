class Window < Gosu::Window

  include Poke
  include Dimensions

  attr_reader :current_map, :controls
  attr_accessor :paused

  def initialize
    @width  = Poke::Dimensions::WIDTH
    @height = Poke::Dimensions::HEIGHT

    super(@width, @height, false)

    self.caption = 'Poke'

    @paused = false

    @player       = User.new(self, 416, 288)
    @controls     = Controls.new(window: self)
    @pause_screen = PauseScreen.new(window: self,
                                     width: @width,
                                    height: @height)

    @map_one      = Map.new(window: self,
                            map_file: 'media/grid_one/map.txt',
                            tile_set: 'media/grid_one/tileset.png')
    @current_map  = @map_one

    @camera       = Camera.new(window: self,
                               player: @player)
  end

  def update
    unless @paused
      @player.update
      @camera.update
    end
  end

  def draw
    translate(-@camera.x, -@camera.y) do
      @current_map.draw
      @player.draw
    end

    if @paused
      @pause_screen.draw
    end
  end

  def button_down(button)
    @controls.press_button(button)
  end

  def button_up(button)
    @controls.release_button(button)
  end

end
