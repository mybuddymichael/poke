class PauseScreen

  def initialize(params)
    Params.check_params(params, [:window, :window_width, :window_height]
    @window        = params[:window]
    @window_width  = params[:window_width]
    @window_height = params[:window_height]

    @pause_button = Gosu::Image.new(@window, 'media/pause_button.png', false)
    @press_q      = Gosu::Image.new(@window, 'media/press_q.png', false)
  end

  def draw
    draw_rect(@window_width, @window_height, Color::TRANS_BLACK,
              ZOrder::PAUSE_BACKGROUND)
    @pause_button.draw(160, 144, ZOrder::PAUSE_BUTTON)
    @press_q.draw(170, 296, ZOrder::PAUSE_BUTTON)
  end

  private

  def draw_rect(width, height, color, z_order)
    # Draws a rectangle by coordinates clockwise from top-left
    @window.draw_quad(0, 0, color, width, 0, color, width, height, color,
                      0, height, color, z_order, :default)
  end

end
