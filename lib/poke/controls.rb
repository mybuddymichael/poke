class Controls

  PARAMS_REQUIRED = [:window]

  BUTTONS = { up:    Gosu::KbUp,
              down:  Gosu::KbDown,
              left:  Gosu::KbLeft,
              right: Gosu::KbRight }

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
    @window = params[:window]
  end

end
