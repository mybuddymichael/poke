# Poke

Poke is a simple game-design project using [Ruby] and [Gosu]. It is intended to be a two-dimensional adventure game, similar to that wonderful Japanese game about [pockets and monsters] \(hence, "Poke", which is certainly a working title).

### So what will the game be like?

I'm thinking robots. In your pocket. (Pokébots?)

### The future

The future of Poke is certainly uncertain, as it's a side-project on which I spend only a limited amount of my free time. That said, I hope to implement the following features:

- An open-ended randomly-generated world, à la Minecraft, Infiniminer, Dwarf Fortress, and the previous pioneers of an open and random game world.
- A system to give the player a sense of accomplishment and a goal. (Possibly collecting or creating robots.)
- A crafting system that allows the player to create various items, vehicles, and robots of infinite possibilities.

See, like I said, *simple*.

### Currently

Poke is in an alpha of alpha state right now. The engine is being actively built and much is frequently changing. It's not a game. It's not fun in any way. However, if you would really like to try it out, here's how...

### Installation

Poke runs on Ruby 1.9.x. To install this *easily*, I highly recommend you use [RVM]. You can read how on the [RVM website][RVM]. I also recommend you install the [Bundler] gem, which makes installating and updating gems crazy easy. So, without further ado:

1. `cd` into where you want to download the source and run `git clone git://github.com/mybuddymichael/Poke.git`
2. If you have Bundler installed, simply type `bundle install` to install gem dependencies. Otherwise you have to `gem install gosu` and  `gem install rmagick`.
3. Install ImageMagick, via [Homebrew] or macports or fink or whatever you want to use.
4. ???
5. `cd` into `Poke/` and `ruby main.rb`

### OBLIGATORY SCREENSHOTS

![](https://github.com/mybuddymichael/Poke/raw/master/screenshots/screenshot.png)
![](https://github.com/mybuddymichael/Poke/raw/master/screenshots/screenshot_paused.png)

Copyright © 2011 Michael Hanson. See LICENSE for license information.


[Ruby]: http://www.ruby-lang.org/en/
[Gosu]: http://libgosu.org/
[pockets and monsters]: http://en.wikipedia.org/wiki/Pokémon_(video_game_series)
[RVM]: https://rvm.beginrescueend.com/
[Bundler]: http://gembundler.com/
[Homebrew]: http://mxcl.github.com/homebrew/
