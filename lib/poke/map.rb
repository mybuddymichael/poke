class Map

  include ReadMap

  PARAMS_REQUIRED = [:window, :map_file, :tileset]

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
  end

end
