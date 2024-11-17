require("tileBoards")
require("sprites")
require("characters")
require("landscape")
require('boundings')

function love.load()
    TileBoards:load()
    Sprites:load()
    Characters:load()
end

function love.update(dt)
    Sprites.fountain:update(dt)
    Sprites.flag:update(dt)
    Sprites.water_fall:update(dt)
    Characters.hero:update(dt)
end

function love.draw()
    Landscape.background(Sprites.grass)
    Landscape.rectangle(200, 200, 20, 15, Sprites.bush_top_left_corner, Sprites.bush_top_right_corner,
    Sprites.bush_bottom_left_corner, Sprites.bush_bottom_right_corner,
        Sprites.bush_horizontal_line, Sprites.bush_vertical_line, nil)
    Sprites.fountain:draw(250, 250, 1)
    Sprites.flag:draw(60, 10, 1)
    Sprites.water_fall:draw(120, 10, 1)
    Landscape.horizontalLine(100,100,180,Sprites.sand_path)
    Landscape.verticalLine(100,100,180,Sprites.sand_path)
    Characters.hero:draw()
end
