require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'gosu'
require './poke.rb'

class TestWindow < MiniTest::Unit::TestCase

  def setup
    @window = Window.new
  end

  def test_that_window_is_created
    refute_nil(@window)
  end

  def test_that_buttons_pushed_contains_the_last_pressed_button
    @window.button_down(Gosu::KbLeft)
    @window.button_down(Gosu::KbUp)
    assert_equal(:up, @window.buttons_pushed.last)
  end

  def test_that_button_release_removes_button_press_from_array
    @window.button_down(Gosu::KbDown)
    @window.button_down(Gosu::KbRight)
    @window.button_down(Gosu::KbLeft)
    @window.button_down(Gosu::KbUp)
    @window.button_up(Gosu::KbUp)
    assert_equal(:left, @window.buttons_pushed.last)
  end

  def test_that_escape_toggles_pause
    @window.button_down(Gosu::KbEscape)
    assert_equal(true, @window.instance_variable_get(:@paused))
    @window.button_down(Gosu::KbEscape)
    assert_equal(false, @window.instance_variable_get(:@paused))
  end

end

class TestUser < MiniTest::Unit::TestCase

  def setup
    @window = Window.new
    @user = User.new(@window, 224, 128)
  end

  def test_that_user_is_created
    refute_nil(@user)
  end

end

class TestCoordinates < MiniTest::Unit::TestCase

  def setup
    @window = Window.new
    @user = User.new(@window, 224, 128)
    @coordinates = Coordinates.new(@window, @user)
  end

  def test_that_coordinates_are_created
    refute_nil(@coordinates)
  end

  def test_that_update_changes_coordinate_text
    @coordinates.update
    assert_equal(@coordinates.instance_variable_get(:@x), @user.x)
  end

end
