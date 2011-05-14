require 'gosu'

# Create the player character class
class Player
	attr_reader :name, :x, :y, :current_image

	def initialize(window, name, x, y)
		@facing_right, @facing_up, @facing_left, @facing_down =
			Gosu::Image.load_tiles(window, 'art/custom_arrows.png', 16, 16, false)
		@direction = @current_image = @facing_down
		@x, @y = x, y
		@name = name
	end

	def update
		case @direction
			when :up    then @current_image = @facing_up
			when :down  then @current_image = @facing_down
			when :left  then @current_image = @facing_left
			when :right then @current_image = @facing_right
		end
	end

	def draw
		@current_image.draw(@x, @y, 0)
	end

	def move
	
	end

	def turn(direction)
		@direction = direction
		case direction
			when :left  then @x -= 4
			when :right then @x += 4
			when :up    then @y -= 4
			when :down  then @y += 4
		end

		if @x < 0 then @x = 0 end
		if @x > (480-16) then @x = (480-16) end
		if @y < 0 then @y = 0 end
		if @y > (320-16) then @y = (320-16) end
	end

end

# Create the main window class
class GameWindow < Gosu::Window
	def initialize
		super(480,320,false)
		self.caption = 'Poke'
		
		@backgroundImage = Gosu::Image.new(self, 'art/white_background.png', true)

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

window = GameWindow.new
window.show
