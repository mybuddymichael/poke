module Poke
  # The +Controls+ controller handles keyboard input from the user.
  class Controls

    # A hash storing symbols for easy reference of individual buttons.
    BUTTONS = { up:     Gosu::KbUp,
                down:   Gosu::KbDown,
                left:   Gosu::KbLeft,
                right:  Gosu::KbRight,
                q:      Gosu::KbQ,
                escape: Gosu::KbEscape }

    # Params required at initialization.
    PARAMS_REQUIRED = [:window]

    # Create a +Controls+ object, storing a reference to the {Window} view and
    # initializing an +Array+ object for containing a list of buttons pressed.
    #
    # @param params [{Symbol: Object}] Hash of params
    # @option params [Window] :window The {Window} view
    #
    # @return [void]
    def initialize(params = {})
      Params.check_params(params, PARAMS_REQUIRED)
      @window = params[:window]
      @buttons_pressed = []
    end

    # Interprets button presses passed by {Window}. If the button is escape, it
    # pauses the update cycle of {Window} ({#toggle_pause}). Calls {#quit} if Q is
    # pressed.
    #
    # @param button [Fixnum] The keyboard button pressed.
    #
    # @return [void]
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
