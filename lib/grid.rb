class Grid

  def initialize(params)
    params = {programfile: nil}.merge(params)
    Params.check_params(params, [:window, :user, :map_file, :tileset])

    @map = Map.new(window, mapfile, tileset)
    @window, @user = params[:window], params[:user]

    create_programs(program_file)
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

  def lines
    @map.lines
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
