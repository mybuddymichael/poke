class Grid

  def initialize(params = {})
    params = {program_file: nil}.merge(params)
    Params.check_params(params, [:window, :user, :map_file, :tileset])

    @window, @user = params[:window], params[:user]
    @map = Map.new(window: @window,
                   map_file: params[:map_file],
                   tileset: params[:tileset])

    if params[:program_file]
      create_programs(params[:program_file])
    end
  end

  def update
  end

  def draw
    @map.draw
  end

  def width
    @map.width
  end

  def height
    @map.height
  end

  def solid_blocks
    @map.solid_blocks
  end

  def map_in_lines
    @map.map_in_lines
  end

  private

  def create_programs(program_file)
    program_map = ProgramMap.new(program_file)
    n = 0
    programs = []

    program_map.map_in_columns.each do |column|
      if column.include?("s")
        n += 1
        programs.push(n)
      end
    end

    programs.each do |number|
      id = 'program_' + number.to_s
      instance_variable_set("@#{id}", Program.new)
    end
  end

end
