module Poke
  # A Camera object provides a viewport to the game window. It allows a player
  # character to move in an area of greater size than the window and still let
  # the user see the movement of the character on the screen.
  class Camera

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
    #
    # Returns a Camera object.
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
      @x = [[@player.x - 224, 0].max, @window.current_grid.width * 32 - 480].min
    end

    # See #get_x.
    #
    # Returns nothing.
    def get_y
      @y = [[@player.y - 144, 0].max,@window.current_grid.height * 32 - 320].min
    end

  end

end
