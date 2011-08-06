module Poke
  # The +Controls+ controller handles keyboard input from the user.
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
          elsif key == :q
            quit
          else
            @buttons_pressed.push(key)
          end
        end
      end
    end

    def release_button(button)
      BUTTONS.each do |key, value|
        if button == value
          @buttons_pressed.delete(key)
        end
      end
    end

    def last_button_pressed
      @buttons_pressed.last
    end

    private

    def toggle_pause
      if @window.paused == false
        @window.paused = true
      else
        @window.paused = false
      end
    end

    def quit
      @window.close if @window.paused
    end

  end

end
