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
                             horizontalLine, verticalLine, filling)
    local tileWidth = topLeftCorner:getTilesWidth()
    local tileHeight = topLeftCorner:getTilesHeight()
    local scale = 1

    width = width - 1
    height = height - 1

    if (width > 0 and height > 0) then
        topLeftCorner:draw(x, y, scale)
        topRightCorner:draw((tileWidth * width + x), y, scale)
        bottomLeftCorner:draw(x, (tileHeight * height + y), scale)
        bottomRightCorner:draw((tileWidth * width + x), (tileHeight * height + y), scale)
        for x = x + tileWidth, (tileWidth * (width - 1) + x), tileWidth do
            horizontalLine:draw(x, y, scale)
            horizontalLine:draw(x, y + tileHeight * height, scale)
        end
        for y = y + tileHeight, (tileHeight * (height - 1) + y), tileHeight do
            verticalLine:draw(x, y, scale)
            verticalLine:draw(x + tileWidth * width, y, scale)
        end
    end
end

function Landscape.background(filling)
    for y = 0, love.graphics.getHeight() - filling:getPixHeight(), filling:getPixHeight() do
        for x = 0, love.graphics.getWidth() - filling:getPixWidth(), filling:getPixWidth() do
            filling:draw(x, y, 1)
        end
    end
end
