require 'gosu'
Dir['./lib/*.rb'].each { |file| require file }

GameWindow.new.show if $0 == __FILE__
