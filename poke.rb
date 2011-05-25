require 'gosu'
Dir['./lib/*.rb'].each { |file| require file }

window = GameWindow.new
window.show
