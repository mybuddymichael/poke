class SpeedCounter

	def initialize(window, player)
		@window, @player = window, player
		@speed_text = Gosu::Font.new(@window, 'media/poke.ttf', 16)
	end

	def update
		@x, @y = @player.x, @player.y
	end

	def draw
		@speed_text.draw("#{@x.to_s}, #{@y.to_s}", 400, 300, 1, 1, 1, Colors::Black,
		                 :default)
	end

end
