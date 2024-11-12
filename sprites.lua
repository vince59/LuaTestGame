local json = require "json"

Sprites = {}

function Sprites:load()
    for spriteName in io.popen([[dir ".\\sprites\\*.json" /b]]):lines() do
        local spriteFile = io.open("sprites/" .. spriteName, "r")
        local jsonStr = spriteFile:read("*all")
        local data = json.decode(jsonStr)
        self[spriteName] = {}
        for field, value in pairs(data) do
            if field == "animation" then
                self[spriteName]["animation"]={}
                for animationNumber, animation in pairs(value) do
                    self[spriteName]["animation"][animationNumber]={}
                    for sliceNumber, slice in pairs(animation) do
                        self[spriteName]["animation"][animationNumber][sliceNumber]={}
                        for tileNumber, tile in pairs(slice) do
                            self[spriteName]["animation"][animationNumber][sliceNumber][tileNumber]=tile
                        end
                    end
                end
            else
                self[spriteName][field]=value
            end
        end
    end
end

function Sprites:draw(spriteName,x,y,scale)
    
end