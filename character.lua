-- Character class

local Character = {}

function Character.new()
    local instance = {}
    setmetatable(instance, { __index = Character })
    return instance
end

function Character:update(dt)
    if love.keyboard.isDown("up") then
        self:move("up", dt)
    elseif love.keyboard.isDown("down") then
        self:move("down", dt)
    elseif love.keyboard.isDown("left") then
        self:move("left", dt)
    elseif love.keyboard.isDown("right") then
        self:move("right", dt)
    else
        self:move("", dt)
    end
    self:checkBoundaries()
    if self.static == false then
        Sprites[self.name .. "_walk_" .. self.direction]:update(dt)
    end
end

function Character:move(direction, dt)
    if direction == "" then
        self.static = true
    else
        self.static = false
        self.direction = direction
        if direction == "up" then
            self.y = self.y - self.speed * dt
        elseif direction == "down" then
            self.y = self.y + self.speed * dt
        elseif direction == "left" then
            self.x = self.x - self.speed * dt
        elseif direction == "right" then
            self.x = self.x + self.speed * dt
        end
    end
end

function Character:checkBoundaries()
    local height = self.height * self.scale
    local width = self.width * self.scale
    if self.y < 0 then
        self.y = 0
    elseif self.y + height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - height
    end
    if self.x < 0 then
        self.x = 0
    elseif self.x + width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - width
    end
end

function Character:draw()
    local spriteName = ""
    if self.static then
        spriteName = self.name .. "_stop_" .. self.direction
    else
        spriteName = self.name .. "_walk_" .. self.direction
    end
    Sprites[spriteName]:draw(self.x, self.y, self.scale)
end

return Character
