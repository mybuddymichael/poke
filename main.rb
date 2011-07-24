require "gosu"
Dir['./lib/modules/*.rb'].each { |file| require file }
Dir['./lib/[^_]*.rb'].each { |file| require file }
Dir['./lib/_*.rb'].each { |file| require file }

Window.new.show if $0 == __FILE__
