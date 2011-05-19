class Player

	attr_reader :name, :x, :y, :current_image

	def initialize(window, name, x, y)
		@facing_right, @facing_up, @facing_left, @facing_down =
			Gosu::Image.load_tiles(window, 'media/arrows.png', 16, 16, false)
		@current_image = @facing_down
		@x, @y = x, y
		@name = name
		@position_range = {xmin: 0, xmax: 480-16, ymin: 0, ymax: 320-16}.freeze
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

	def move(direction)
		@direction = direction
		case direction
			when :left  then @x -= 4
			when :right then @x += 4
			when :up    then @y -= 4
			when :down  then @y += 4
		end


		if @x < @position_range[:xmin] then @x = @position_range[:xmin] end
		if @x > @position_range[:xmax] then @x = @position_range[:xmax] end
		if @y < @position_range[:ymin] then @y = @position_range[:ymin] end
		if @y > @position_range[:ymax] then @y = @position_range[:ymax] end
	end

end
