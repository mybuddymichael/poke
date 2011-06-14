module Color
  Black       = Gosu::Color::BLACK
  White       = Gosu::Color::WHITE
  Trans_black = Gosu::Color.argb(0xd5000000)
end

module ZOrder
  Background, Grid, Map, NPC_high, Player, NPC_low, Pause_background,
    Pause_button = *0..7
end

module Media
  Font = 'media/poke.dfont'
end
