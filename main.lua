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
    Boundings:clear()
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        print(x,y)
    end
end

function love.draw()
    love.graphics.setColor(255,0,0) --Red
    Landscape.background(Sprites.grass)
    Landscape.rectangle(200, 200, 20, 15, Sprites.bush_top_left_corner, Sprites.bush_top_right_corner,
    Sprites.bush_bottom_left_corner, Sprites.bush_bottom_right_corner,
        Sprites.bush_horizontal_line, Sprites.bush_vertical_line,nil,true)
    Sprites.fountain:draw(250, 250, 1, true)
    Sprites.flag:draw(60, 10, 1)
    Sprites.water_fall:draw(120, 10, 1)
    Landscape.verticalLine(360,149,10,Sprites.sand_path,false)
    Landscape.verticalLine(365,149,10,Sprites.sand_path,false)
    Characters.hero:draw()
end
