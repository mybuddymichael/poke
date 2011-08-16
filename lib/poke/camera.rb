module Poke
  # A Camera object provides a viewport to the game window. It allows a player
  # character to move in an area of greater size than the window and still let
  # the user see the movement of the character on the screen.
  class Camera

    include Poke::Dimensions

    # Params required at initialization.
    PARAMS_REQUIRED = [:window, :player]

    # Returns a Fixnum of the Camera's x-axis value.
    attr_reader :x

    # Returns a Fixnum of the Camera's x-axis value.
    attr_reader :y

    # Creates a Camera object.
    #
    # params - The Hash of Symbol options.
    #   :window - The Window object creating Camera.
    #   :player - The Player object that the Camera is tracking.
    def initialize(params = {})
      Poke::Params.check_params(params, PARAMS_REQUIRED)
      @window = params[:window]
      @player = params[:player]
    end

    # Called by Window at designated intervals, calls #get_x and #get_y to
    # calculate the Camera's x and y values, which are stored in
    # publicly-accessible instance variables.
    #
    # Returns nothing.
    def update
      get_x
      get_y
    end

  private

    # Calculates what Camera's x-axis value should be. It is based on the
    # Player's position. It will not track beyond the left or right edges of the
    # Map, but otherwise keeps the Player in the center of the viewport.
    #
    # Returns nothing.
    def get_x
      grid_width = @window.current_map.width
      half_x = WIDTH / 2 - GRID / 2
      @x = [[@player.x - half_x, 0].max, grid_width * GRID - WIDTH].min
    end

    # See #get_x.
    #
    # Returns nothing.
    def get_y
      grid_height = @window.current_map.height
      half_y = HEIGHT / 2 - GRID / 2
      @y = [[@player.y - half_y, 0].max, grid_height * GRID - HEIGHT].min
    end

  end
end
