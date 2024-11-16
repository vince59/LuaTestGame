
require("assets")
require("sprites")

function love.load()
    Assets:load()
    Sprites:load()
end

function love.update(dt)
    Sprites.fountain:update(dt)
    Sprites.flag:update(dt)
    Sprites.water_fall:update(dt)
    Sprites.hero_walk_down:update(dt)
    Sprites.hero_walk_up:update(dt)
    Sprites.hero_walk_left:update(dt)
    Sprites.hero_walk_right:update(dt)
end

function love.draw()
    Sprites.fountain:draw(10,10,1)
    Sprites.flag:draw(60,10,1)
    Sprites.water_fall:draw(120,10,1)
    Sprites.hero_walk_down:draw(140,10,1)
    Sprites.hero_walk_up:draw(160,10,1)
    Sprites.hero_walk_left:draw(180,10,1)
    Sprites.hero_walk_right:draw(200,10,1)
end