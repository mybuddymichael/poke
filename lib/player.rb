class Player

	attr_reader :name, :x, :y, :direction, :locked

	def initialize(window, name, x, y)
		@facing_right, @facing_up, @facing_left, @facing_down =
			Gosu::Image.load_tiles(window, 'media/arrows.png', 32, 32, false)
		@current_image = @facing_down

		@x, @y = x, y
		@name  = name

		@movement_factor = 2
		@position_range  = {xmin: 0, xmax: 480-32, ymin: 0, ymax: 320-32}.freeze
	end

	def update
		case @direction
			when :up
				@current_image = @facing_up
				@y -= @movement_factor
			when :down
				@current_image = @facing_down
				@y += @movement_factor
			when :left
				@current_image = @facing_left
				@x -= @movement_factor
			when :right
				@current_image = @facing_right
				@x += @movement_factor
			else
				if @locked == true
					case @current_image
						when @facing_up    then @y -= @movement_factor
						when @facing_down  then @y += @movement_factor
						when @facing_left  then @x -= @movement_factor
						when @facing_right then @x += @movement_factor
					end
				end
		end
	
		# If the player position is off the screen, move him just inside
		if @x < @position_range[:xmin] then @x = @position_range[:xmin] end
		if @x > @position_range[:xmax] then @x = @position_range[:xmax] end
		if @y < @position_range[:ymin] then @y = @position_range[:ymin] end
		if @y > @position_range[:ymax] then @y = @position_range[:ymax] end

		lock_direction_unless_square
		
		# This makes the player stop when the button is released
		reset_direction
	end

	def draw
		@current_image.draw(@x, @y, ZOrder::Player)
	end

	def move(direction)
		@direction = direction
	end

	def reset_direction
		@direction = :no_direction
	end

	def lock
		@locked = true
	end

	def unlock
		@locked = false
	end

	def lock_direction_unless_square
		if (@x%32 == 0) and (@y%32 == 0)
			unlock
		else
			lock
		end
	end

end
