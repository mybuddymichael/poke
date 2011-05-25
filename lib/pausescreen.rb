class PauseScreen

	def initialize(window, window_width, window_height)
		@pause_button = Gosu::Image.new(window, 'media/pause_button.png', true)
		@window_width, @window_height = window_width, window_height
		@window = window
	end

end
