-- Character class

local Character = {}

function Character.new()
    local instance = {}
    setmetatable(instance, { __index = Character })
    return instance
end

function Character:update(dt)
    local x = self.x
    local y = self.y

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
    if self.static then
        self.spriteName = self.name .. "_stop_" .. self.direction
    else
        self.spriteName = self.name .. "_walk_" .. self.direction
    end
    if self:isOutOfBounds() then
        self.x = x
        self.y = y
    end
    if self.static == false then
        Sprites[self.spriteName]:update(dt)
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

function Character:isOutOfBounds()
    local height = self.height * self.scale
    local width = self.width * self.scale

    if self.y < 0 or self.y + height > love.graphics.getHeight() or self.x < 0 or self.x + width > love.graphics.getWidth() then
        return true
    else
        return Boundings:isOutOfBounds(self.x, self.y, Sprites[self.spriteName])
    end
end

function Character:draw()
    Sprites[self.spriteName]:draw(self.x, self.y, self.scale)
end

return Character
