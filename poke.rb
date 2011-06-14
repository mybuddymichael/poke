require 'gosu'
require './lib/player.rb'
Dir['./lib/*.rb'].each { |file| require file }

Window.new.show if $0 == __FILE__
