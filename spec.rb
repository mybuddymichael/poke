require 'minitest/autorun'
require 'gosu'
require './lib/player.rb'
require './lib/window.rb'

class TestPlayer < MiniTest::Unit::TestCase

	def setup
		@window = GameWindow.new
		@player = Player.new(@window, 'Ferd', 100, 100)
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
			200.times do
				@player.move(direction)
				@player.update
			end
			case direction
				when :up    then assert_equal(0, @player.y)
				when :down  then assert_equal(304, @player.y)
				when :left  then assert_equal(0, @player.x)
				when :right then assert_equal(464, @player.x)
			end
		end
	end

end

class TestWindow < MiniTest::Unit::TestCase

	def setup
		@window = GameWindow.new
	end

	def test_that_window_is_created
		refute_nil(@window)
	end

end
