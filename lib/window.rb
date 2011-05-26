class GameWindow < Gosu::Window

	def initialize
		super(480,320,false)
		self.caption = 'Poke'

		@window_width, @window_height = 480, 320
		
		# The player image is 32*32px, so use math to center it in the screen
		@player       = Player.new(self, 'Ferd', (480/2 - 32/2), (320/2 - 32/2))
		@pause_screen = PauseScreen.new(self, @window_width, @window_height)
		@speed_counter = SpeedCounter.new(self, @player)

		# Create an array to keep track of the controls
		@buttons_pushed = []
	end
	
	def update
		unless @paused
			case @buttons_pushed.last
				when :up    then @player.move(:up)
				when :down  then @player.move(:down)
				when :left  then @player.move(:left)
				when :right then @player.move(:right)
			end
			@player.update
			@speed_counter.update
		end
	end
	
	def draw
		draw_rect(@window_width, @window_height,
		          Colors::White, ZOrder::Background)
		@player.draw
		@speed_counter.draw
		if @paused
			@pause_screen.draw
		end
	end
	
	def button_down(id)
		case id
			when Gosu::KbUp     then @buttons_pushed.push(:up)
			when Gosu::KbDown   then @buttons_pushed.push(:down)
			when Gosu::KbLeft   then @buttons_pushed.push(:left)
			when Gosu::KbRight  then @buttons_pushed.push(:right)
			when Gosu::KbEscape then toggle_pause
			when Gosu::KbQ      then close if @paused
		end
	end
	
	def button_up(id)
		case id
			when Gosu::KbUp    then @buttons_pushed.delete(:up)
			when Gosu::KbDown  then @buttons_pushed.delete(:down)
			when Gosu::KbLeft  then @buttons_pushed.delete(:left)
			when Gosu::KbRight then @buttons_pushed.delete(:right)
		end
	end

	def toggle_pause
		if @paused
			@paused = false
		elsif !@paused
			@paused = true
		end
	end

	def draw_rect(width, height, color, z_order)
		# Draws a rectangle by coordinates clockwise from top-left
		draw_quad(0, 0, color, width, 0, color, width, height, color,
		          0, height, color, z_order, :default)
	end

end
