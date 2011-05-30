class Coordinates

  def initialize(window, player)
    @window, @player = window, player
    @coordinate_text = Gosu::Font.new(@window, Media::Font, 16)
  end

  def update
    @x, @y = @player.x, @player.y
  end

  def draw
    @coordinate_text.draw("#{@x.to_s}, #{@y.to_s}", 400, 300, 1, 1, 1, Color::Black,
                          :default)
  end

end
