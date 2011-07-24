class Controls

  PARAMS_REQUIRED = [:window]

  BUTTONS = { up:     Gosu::KbUp,
              down:   Gosu::KbDown,
              left:   Gosu::KbLeft,
              right:  Gosu::KbRight,
              q:      Gosu::KbQ,
              escape: Gosu::KbEscape }

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
    @window = params[:window]
    @buttons_pressed = []
  end

  def press_button(button)
    BUTTONS.each do |key, value|
      if button == value
        if key == :escape
          toggle_pause
        else
          @buttons_pressed.push(key)
        end
      end
    end
  end

  def release_button(button)
    BUTTONS.each do |key, value|
      if button == value
        if key == :escape
          toggle_pause
        else
          @buttons_pressed.delete(key)
        end
      end
    end
  end

  def last_button_pressed
    @buttons_pressed.last
  end

  def toggle_pause
    if @window.paused == false
      @window.paused = true
    else
      @window.paused = false
    end
  end

end
