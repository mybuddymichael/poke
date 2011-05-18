require 'minitest/autorun'
require 'gosu'
require './lib/player.rb'
require './lib/window.rb'

class TestPlayer < MiniTest::Unit::TestCase

	def setup
		@window = GameWindow.new
		@player = Player.new(@window, 'Ferd', 100, 100)
	end

	def test_that_player_is_created
		refute_nil(@player)
	end

	def test_that_player_will_move
		@player.move(:left)
		assert_equal(96, @player.x)
		@player.move(:right)
		assert_equal(100, @player.x)
		@player.move(:up)
		assert_equal(96, @player.y)
		@player.move(:down)
		assert_equal(100, @player.y)
	end

	def test_that_player_will_stay_onscreen
		100.times do
			@player.move(:right)
		end
		assert_equal(464, @player.x)

		150.times do
			@player.move(:left)
		end
		assert_equal(0, @player.x)

		100.times do
			@player.move(:up)
		end
		assert_equal(0, @player.y)

		100.times do
			@player.move(:down)
		end
		assert_equal(304, @player.y)
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
