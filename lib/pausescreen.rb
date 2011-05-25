class PauseScreen

	def initialize(window, window_width, window_height)
		@window = window
		@window_width, @window_height = window_width, window_height

		@pause_button = Gosu::Image.new(window, 'media/pause_button.png', true)
		@pause_text   = Gosu::Image.from_text(window, 'Paused', 'Poke', 16)
	end

	def draw
		draw_rect(@window_width, @window_height, Colors::Trans_black,
		          ZOrder::Pause_background)
		@pause_button.draw(160, 144, ZOrder::Pause_button)
	end

	def draw_rect(width, height, color, z_order)
		# Draws a rectangle by coordinates clockwise from top-left
		@window.draw_quad(0, 0, color, width, 0, color, width, height, color,
		                  0, height, color, z_order, :default)
	end

end
