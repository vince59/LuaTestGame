-- TileBoard class

local TileBoard = {}

function TileBoard.new()
    local instance={}
    setmetatable(instance, {__index = TileBoard})
    instance.imagePath=""
    instance.width=0
    instance.height=0
    instance.nbCol=0
    instance.nbLine=0
    return instance
end

function TileBoard:drawTile(tileNumber,x,y,scale)
    love.graphics.draw(self.spriteSheet, self.quads[tileNumber], x,y, 0, scale)
end

function TileBoard:load()
    self.spriteSheet = love.graphics.newImage(self.imagePath)
    self.quads = {};
    self.nbCol=self.spriteSheet:getWidth()/self.width
    self.nbLine=self.spriteSheet:getHeight()/self.height
    for y = 0, self.spriteSheet:getHeight() - self.height, self.height do
        for x = 0, self.spriteSheet:getWidth() - self.width, self.width do
            table.insert(self.quads, love.graphics.newQuad(x, y, self.width, self.height, self.spriteSheet:getDimensions()))
        end
    end
end

return TileBoard