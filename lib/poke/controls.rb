class Controls

  PARAMS_REQUIRED = [:window]

  BUTTONS = { up:    Gosu::KbUp,
              down:  Gosu::KbDown,
              left:  Gosu::KbLeft,
              right: Gosu::KbRight }

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
    @window = params[:window]
    @buttons_pressed = []
  end

  def press_button(button)
    BUTTONS.each do |key, value|
      if button == value
        @buttons_pressed.push(key)
      end
    end
  end

end
