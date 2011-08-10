class Window < Gosu::Window

  include Poke

  attr_reader :current_grid, :controls
  attr_accessor :paused

  def initialize
    super(480, 320, false)
    self.caption = 'Poke'
    @width, @height = 480, 320

    @paused = false

    @player       = User.new(self, 416, 288)
    @controls     = Controls.new(window: self)
    @pause_screen = PauseScreen.new(window: self,
                                     width: @width,
                                    height: @height)

    @grid_one     = Grid.new(window: self,
                               user: @player,
                           map_file: "media/grid_one/map.txt",
                            tileset: "media/grid_one/tileset.png")
    @current_grid = @grid_one

    @camera       = Camera.new(window: self,
                               player: @player)
  end

  def update
    unless @paused
      @current_grid.update
      @player.update
      @camera.update
    end
  end

  def draw
    translate(-@camera_x, -@camera_y) do
      @current_grid.draw
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
