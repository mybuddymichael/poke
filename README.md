Poke
====

Poke is a simple game-design experiment using [Ruby] and the [Gosu framework]. 

### Installation

Poke runs on Ruby 1.9.x. To install this *easily*, I recommend you use
[ruby-build] + [rbenv]. You can read how on the [ruby-build
website][ruby-build]. I also recommend you install the [Bundler] gem, which
makes installating and updating gems crazy easy. So, without further ado:

1. `cd` into where you want to download the source and run `git clone
   git://github.com/mybuddymichael/Poke.git`.
2. If you have [Bundler] installed, `cd` into `Poke/` and simply type

        $ bundle install

    to install gem dependencies. Otherwise you have to

        $ gem install gosu
        $ gem install rmagick

3. Install ImageMagick, via [Homebrew] or macports or fink or whatever you want
   to use.
4. ???
5. Make sure you're `cd`'d into `Poke/` and `ruby main.rb`.

### OBLIGATORY SCREENSHOTS

![](http://dl.dropbox.com/u/2827486/poke_screenshot.png)
![](http://dl.dropbox.com/u/2827486/poke_screenshot_paused.png)

### License

Copyright © 2011 Michael Hanson. Released under the MIT license; see LICENSE.


[Ruby]: http://www.ruby-lang.org/en/
[Gosu framework]: http://libgosu.org/
[pockets and monsters]: http://en.wikipedia.org/wiki/Pokémon_(video_game_series)
[rbenv]:https://github.com/sstephenson/rbenv
[ruby-build]:https://github.com/sstephenson/ruby-build
[Bundler]: http://gembundler.com/
[Homebrew]: http://mxcl.github.com/homebrew/
