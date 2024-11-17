-- global Boundings table

Boundings = {}
Boundings.limits = {}

function Boundings:addLimit(x, y, width, height, limit)
    print(limit)
    if limit ~= nil then
        self.limits[#self.limits + 1] = { x = x, y = y, width = width, height = height, limit = limit }
    end
end

function Boundings:checkCollision(x, y, sprite)
    for i = #self.limits, 1, -1 do
        if self.limits[i].x < x + sprite:getWidth() and
            x < self.limits[i].x + self.limits[i].width and
            self.limits[i].y < y + sprite:getHeight() and
            y < self.limits[i].y + self.limits[i].height then
                print("paf",i)
            return self.limits[i].limit
        end
    end
    return false
end

return Boundings
