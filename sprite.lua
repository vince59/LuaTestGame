-- Sprite class

local Sprite = {}

function Sprite.new()
    local instance={}
    setmetatable(instance, {__index = Sprite})
    return instance
end

function Sprite:update(dt)
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.duration then
        self.currentTime = self.currentTime - self.duration
    end
end

function Sprite:draw(x,y,scale)
    local animationNum = math.floor(self.currentTime / self.duration * #self.animation) + 1
    local i=0
    for row=1,self.height do
        for col=1,self.width do 
            i=i+1
            local x1=x+((col-1)*TileBoards[self.tilesName].width)
            local y1=y+((row-1)*TileBoards[self.tilesName].height)
            TileBoards[self.tilesName]:drawTile(self.animation[animationNum].tiles[i],x1,y1,scale)
        end
    end
end

return Sprite
