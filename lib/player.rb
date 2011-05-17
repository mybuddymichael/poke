class Player

	attr_reader :name, :x, :y, :current_image

	def initialize(window, name, x, y)
		@facing_right, @facing_up, @facing_left, @facing_down =
			Gosu::Image.load_tiles(window, 'media/arrows.png', 16, 16, false)
		@current_image = @facing_down
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

	def move(direction)
		@direction = direction
		case direction
			when :left  then @x -= 4
			when :right then @x += 4
			when :up    then @y -= 4
			when :down  then @y += 4
		end

		position_extremes = {xmin: 0, xmax: 480-16, ymin: 0, ymax: 320-16}

		if @x < position_extremes[:xmin] then @x = position_extremes[:xmin] end
		if @x > position_extremes[:xmax] then @x = position_extremes[:xmax] end
		if @y < position_extremes[:ymin] then @y = position_extremes[:ymin] end
		if @y > position_extremes[:ymax] then @y = position_extremes[:ymax] end
	end

end
