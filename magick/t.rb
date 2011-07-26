require 'rmagick'

@full_image = Magick::Image.read("full.png")
@ilist = Magick::ImageList.new

@map = File.readlines("map.txt").map { |line| line.chomp }
@key = eval(@map.last)

2.times do
  @map.delete (@map.last)
end

@width = @map[0].size
@height = @map.size

3.times do |i|
  image = @full_image[0].crop((i*32),0,32,32)
  image.write("tile#{i}.png")
  instance_variable_set("@tile#{i}", Magick::Image.read("tile#{i}.png"))
end

@image_list = []

@height.times do |y|
  @width.times do |x|
    @key.each do |key, value|
      if @map[y][x] == key
        @image_list.push("tile#{value}.png")
      end
    end
  end
end

`montage #{@image_list.join(" ")} -tile #{@width}x -geometry 32x32+0+0 tileset.png`
