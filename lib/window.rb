class GameWindow < Gosu::Window

	def initialize
		super(480,320,false)
		self.caption = 'Poke'
		
		@backgroundImage = Gosu::Image.new(self, 'media/white_background.png', true)

		# The player image is 16*16px, so use math to center it in the screen
		@player = Player.new(self, 'Ferd', (480/2 - 16/2), (320/2 - 16/2))

		# Create an array to keep track of the controls
		@buttons_pushed = []
	end
	
	def update
		# This is probably unnecessary and but nil scares the hell out of me.
		@buttons_pushed.uniq! if @buttons_pushed.uniq!

		case @buttons_pushed.last
			when :up    then @player.move(:up)
			when :down  then @player.move(:down)
			when :left  then @player.move(:left)
			when :right then @player.move(:right)
		end
		@player.update
	end
	
	def draw
		@backgroundImage.draw(0,0,0)
		@player.draw
	end
	
	def button_down(id)
		case id
			when Gosu::KbUp     then @buttons_pushed.push(:up)
			when Gosu::KbDown   then @buttons_pushed.push(:down)
			when Gosu::KbLeft   then @buttons_pushed.push(:left)
			when Gosu::KbRight  then @buttons_pushed.push(:right)
			when Gosu::KbEscape then close
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

end
