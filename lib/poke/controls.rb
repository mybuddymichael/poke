class Controls

  PARAMS_REQUIRED = [:window]

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
    
  end

end
