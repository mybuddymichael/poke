class Coordinates

  def initialize(window, user)
    @window, @user = window, user
    @coordinate_text = Gosu::Font.new(@window, Media::Font, 16)
  end

  def update
    @x, @y = @user.x, @user.y
  end

  def draw
    @coordinate_text.draw("#{@x.to_s}, #{@y.to_s}", 416, 300, 1, 1, 1,
                          Color::White, :default)
  end

end
