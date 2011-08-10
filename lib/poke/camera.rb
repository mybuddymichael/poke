module Poke
  # A Camera object provides a viewport to the game window. It allows a player
  # character to move in an area of greater size than the window and still let
  # the user see the movement of the character on the screen.
  class Camera

    # Params required at initialization.
    PARAMS_REQUIRED = [:player]

    # Creates a Camera object.
    #
    # params - The Hash of Symbol options.
    #   :player - The Player object that the Camera is tracking.
    #
    # Returns a Camera object.
    def initialize(params = {})
      @player = params[:player]
      @x, @y  = 0
    end

    def update
    end
  end

end
