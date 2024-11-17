-- landscape library

Landscape = {}

function Landscape.horizontalLine(x,y,length,sprite,isOutOfBounds)
    Boundings:addLimit(x,y,length*sprite:getPixWidth(),sprite:getPixHeight(),isOutOfBounds)
    local tileWidth = sprite:getTilesWidth()
    local scale = 1
    for x = x, (tileWidth * (length-1) + x), tileWidth do
        sprite:draw(x, y, scale)
    end
end

function Landscape.verticalLine(x,y,length,sprite,isOutOfBounds)
    Boundings:addLimit(x,y,sprite:getPixWidth(),length*sprite:getPixHeight(),isOutOfBounds)
    local tileHeight = sprite:getTilesHeight()
    local scale = 1
    for y = y + tileHeight, (tileHeight * (length - 1) + y), tileHeight do
        sprite:draw(x, y, scale)
    end
end

function Landscape.rectangle(x, y, width, height, topLeftCorner, topRightCorner, bottomLeftCorner, bottomRightCorner,
                             horizontalLine, verticalLine, filling, isOutOfBounds)
    local tileWidth = topLeftCorner:getTilesWidth()
    local tileHeight = topLeftCorner:getTilesHeight()
    local scale = 1

    width = width - 1
    height = height - 1

    if (width > 0 and height > 0) then
        topLeftCorner:draw(x, y, scale,isOutOfBounds)
        topRightCorner:draw((tileWidth * width + x), y, scale,isOutOfBounds)
        bottomLeftCorner:draw(x, (tileHeight * height + y), scale,isOutOfBounds)
        bottomRightCorner:draw((tileWidth * width + x), (tileHeight * height + y), scale,isOutOfBounds)
        Landscape.horizontalLine(x + tileWidth,y,width-1,horizontalLine,isOutOfBounds)
        Landscape.horizontalLine(x + tileWidth,y+tileHeight*height,width-1,horizontalLine,isOutOfBounds)
        Landscape.verticalLine(x,y,height,verticalLine,isOutOfBounds)
        Landscape.verticalLine(x + tileWidth*width,y,height,verticalLine,isOutOfBounds)
    end
end

function Landscape.background(filling)
    for y = 0, love.graphics.getHeight() - filling:getPixHeight(), filling:getPixHeight() do
        for x = 0, love.graphics.getWidth() - filling:getPixWidth(), filling:getPixWidth() do
            filling:draw(x, y, 1)
        end
    end
end
