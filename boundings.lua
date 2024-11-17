-- global Boundings table

Boundings = {}
Boundings.limits = {}

function Boundings:addLimit(x, y, width, height, IsOutOfBounds)
    if IsOutOfBounds ~= nil then
        if (IsOutOfBounds) then
            love.graphics.setColor(255,0,0) --Red
        else
            love.graphics.setColor(0,0,255) --Blue
        end
        love.graphics.rectangle("line",x, y, width, height)
        self.limits[#self.limits + 1] = { x = x, y = y, width = width, height = height, outOfBounds = IsOutOfBounds }
    end
    love.graphics.reset( )
end

function Boundings:isOutOfBounds(x, y, sprite)
    for i = #self.limits, 1, -1 do
        if self.limits[i].x < x + sprite:getPixWidth() and
            x < self.limits[i].x + self.limits[i].width and
            self.limits[i].y < y + sprite:getPixHeight() and
            y < self.limits[i].y + self.limits[i].height then
            return self.limits[i].outOfBounds
        end
    end
    return false
end

function Boundings:clear()
    self.limits={}
end

return Boundings
