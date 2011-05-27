require 'minitest/autorun'
require 'gosu'
Dir['./lib/*.rb'].each { |file| require file }

class TestWindow < MiniTest::Unit::TestCase

	def setup
		@window = GameWindow.new
	end

	def test_that_window_is_created
		refute_nil(@window)
	end

end

class TestPauseScreeen < MiniTest::Unit::TestCase

	def setup
		@window = GameWindow.new
		@pause_screen = PauseScreen.new(@window, 480, 320)
	end

	def test_that_pause_screen_is_created
		refute_nil(@pause_screen)
	end

end

class TestPlayer < MiniTest::Unit::TestCase

	def setup
		@window = GameWindow.new
		@player = Player.new(@window, 'Ferd', 224, 128)
		@directions = [:up, :down, :left, :right].freeze
	end

	def test_that_player_is_created
		refute_nil(@player)
	end

	def test_that_player_will_move
		@directions.each do |direction|
			@player.move(direction)
			assert_equal(direction, @player.direction)
		end
	end

	def test_that_player_will_stay_onscreen
		@directions.each do |direction|
			300.times do
				@player.move(direction)
				@player.update
			end
			case direction
				when :up    then assert_equal(0, @player.y)
				when :down  then assert_equal(288, @player.y)
				when :left  then assert_equal(0, @player.x)
				when :right then assert_equal(448, @player.x)
			end
		end
	end

	def test_that_direction_can_be_reset
		@player.reset_direction
		assert_equal(:no_direction, @player.direction)
	end

end
