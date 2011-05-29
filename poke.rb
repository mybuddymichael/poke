require 'gosu'
Dir['./lib/*.rb'].each { |file| require file }

Window.new.show if $0 == __FILE__
