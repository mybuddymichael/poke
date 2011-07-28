class Map

  include ReadMap

  PARAMS_REQUIRED = [:window, :map_file, :tileset]

  def initialize(params)
    Params.check_params(params, PARAMS_REQUIRED)
    @map_in_lines = get_lines(params[:map_file])

    @map_key = extract_map_key
  end

  def extract_map_key
    eval(@map_in_lines.last)
  end

end
