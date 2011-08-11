require_relative 'test_helper'

class TestCamera < Poke::Test

  class Player
    attr_reader :x, :y

    def initialize
      @x = 32
      @y = 64
    end
  end

  def setup
    @window = TWindow.new
    @player = Player.new
    @camera = Poke::Camera.new(window: @window, player: @player)
  end

end
