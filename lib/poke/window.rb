class Window < Gosu::Window

  attr_reader :current_grid, :controls
  attr_accessor :paused

  def initialize
    super(480, 320, false)
    self.caption = 'Poke'
    @width, @height = 480, 320

    @camera_x = @camera_y = 0

    @paused = false

    @user         = User.new(self, 416, 288)
    @controls     = Controls.new(window: self)
    @pause_screen = PauseScreen.new(window: self,
                                     width: @width,
                                    height: @height)

    @grid_one     = Grid.new(window: self,
                               user: @user,
                           map_file: "media/grid_one/map.txt",
                            tileset: "media/grid_one/tileset.png")
    @current_grid = @grid_one
  end

  def update
    unless @paused
      @current_grid.update
      @user.update
      @camera_x = [[@user.x - 224, 0].max, @current_grid.width * 32 - 480].min
      @camera_y = [[@user.y - 160, 0].max, @current_grid.height * 32 - 320].min
    end
  end

  def draw
    translate(-@camera_x, -@camera_y) do
      @current_grid.draw
      @user.draw
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

  private

end
