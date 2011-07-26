class Map

  include ReadMap

  PARAMS_REQUIRED = [:window, :map_file, :tileset]

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
    @map_file = params(:map_file)

    @map_key = extract_map_key
  end

  def extract_map_key
    @map_file.last
  end

end
