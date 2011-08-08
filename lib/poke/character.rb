module Poke
  # +Character+ is a base class for both non-player and player characters. It
  # contains various methods for moving, updating, drawing, and collision
  # detection.
  class Character

    PARAMS_REQUIRED = [:window, :x, :y]

    attr_reader :x
    attr_reader :y
    attr_reader :direction

    def initialize(params = {})
      Poke::Params.check_params(params, PARAMS_REQUIRED)
    end

    def update
    end

    def draw
    end

  private

    def lock_direction_unless_square
    end

    def lock
    end

    def unlock
    end

  end

end
