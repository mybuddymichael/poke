module Poke

  module Dimensions
    GRID   = 32
    HEIGHT = 15 * GRID
    WIDTH  = 10 * GRID
  end

  module Color
    BLACK       = Gosu::Color::BLACK
    WHITE       = Gosu::Color::WHITE
    TRANS_BLACK = Gosu::Color.argb(0xd5000000)
  end

  module ZOrder
    BACKGROUND, GRID, MAP, NPC_HIGH, PLAYER, NPC_LOW, PAUSE_BACKGROUND,
      PAUSE_BUTTON = *0..7
  end

  module Media
    FONT = 'media/poke.dfont'
  end

end
