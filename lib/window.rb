class GameWindow < Gosu::Window

	def initialize
		super(480,320,false)
		self.caption = 'Poke'

		@window_width, @window_height = 480, 320
		
		@pause_button = Gosu::Image.new(self, 'media/pause_button.png', true)

		@trans_gray = Gosu::Color.argb(0xaa000000)
		@white      = Gosu::Color::WHITE

		# The player image is 16*16px, so use math to center it in the screen
		@player = Player.new(self, 'Ferd', (480/2 - 16/2), (320/2 - 16/2))

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
		end
	end
	
	def draw
		draw_rect(@window_width, @window_height, @white, 0)
		@player.draw
		if @paused
			draw_rect(@window_width, @window_height, @trans_gray, 1)
			@pause_button.draw(160,144,2)
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
		draw_quad(0, 0, color, width, 0, color,
		          width, height, color, 0, height, color,
		          z_order, :default)
	end

end
