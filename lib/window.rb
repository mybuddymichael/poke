class GameWindow < Gosu::Window

	def initialize
		super(480,320,false)
		self.caption = 'Poke'
		
		@backgroundImage = Gosu::Image.new(self, 'media/white_background.png', true)

		# The player image is 16*16px, so use math to center it in the screen
		@player = Player.new(self, 'Ferd', (480/2 - 16/2), (320/2 - 16/2))
	end
	
	def update
		if button_down? Gosu::KbLeft or button_down? Gosu::KbA
			@player.turn(:left)
		end
		if button_down? Gosu::KbRight or button_down? Gosu::KbD
			@player.turn(:right)
		end
		if button_down? Gosu::KbDown or button_down? Gosu::KbS
			@player.turn(:down)
		end
		if button_down? Gosu::KbUp or button_down? Gosu::KbW
			@player.turn(:up)
		end
		@player.update
	end
	
	def draw
		@backgroundImage.draw(0,0,0)
		@player.draw
	end
	
	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end

end
