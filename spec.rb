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
    @window.button_down(Gosu::KbLeft)
    @window.button_down(Gosu::KbUp)
    @window.button_up(Gosu::KbUp)
    assert_equal(:left, @window.buttons_pushed.last)
  end

end

class TestUser < MiniTest::Unit::TestCase

  def setup
    @window = Window.new
    @user = User.new(@window, 'Ferd', 224, 128)
    @directions = [:up, :down, :left, :right].freeze
  end

  def test_that_user_is_created
    refute_nil(@user)
  end

  def test_that_user_will_move
    @directions.each do |direction|
      @user.move(direction)
      assert_equal(direction, @user.direction)
    end
  end

  def test_that_user_will_stay_onscreen
    @directions.each do |direction|
      300.times do
        @user.move(direction)
        @user.update
      end
      case direction
        when :up    then assert_equal(0, @user.y)
        when :down  then assert_equal(288, @user.y)
        when :left  then assert_equal(0, @user.x)
        when :right then assert_equal(448, @user.x)
      end
    end
  end

  def test_that_direction_can_be_reset
    @user.reset_direction
    assert_equal(:no_direction, @user.direction)
  end

end
