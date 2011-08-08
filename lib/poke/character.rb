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
    end

  end
  
end
