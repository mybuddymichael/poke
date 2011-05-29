class Coordinates

	def initialize(window, player)
		@window, @player = window, player
<<<<<<< HEAD
=======
		@coordinate_text = Gosu::Font.new(@window, 'media/poke.ttf', 18)
>>>>>>> 1fbe6fda006ace37cd8244f93fd422aa5656b64f
	end

	def update
		@x, @y = @player.x, @player.y
	end

	def draw
		@coordinate_text.draw("#{@x.to_s}, #{@y.to_s}", 400, 300, 1, 1, 1, Colors::Black,
		                 :default)
	end

end
