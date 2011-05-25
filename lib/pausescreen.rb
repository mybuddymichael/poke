class PauseScreen

	def initialize(window, window_width, window_height)
		@pause_button = Gosu::Image.new(window, 'media/pause_button.png', true)
		@window_width, @window_height = window_width, window_height
		@window = window
	end

	def draw
		draw_rect(@window_width, @window_height, Pokeconstants::Trans_black,
		          ZOrder::Pause_background)
	end

	def draw_rect(width, height, color, z_order)
		# Draws a rectangle by coordinates clockwise from top-left
		@window.draw_quad(0, 0, color, width, 0, color,
		          width, height, color, 0, height, color,
		          z_order, :default)
	end

end
