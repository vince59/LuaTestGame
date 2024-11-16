local json = require "json"
local Sprite = require("sprite")

Sprites = {}

function Sprites:load()
    for spriteName in io.popen([[dir ".\\sprites\\*.json" /b]]):lines() do
        local spriteFile = io.open("sprites/" .. spriteName, "r")
        local jsonStr = spriteFile:read("*all")
        local data = json.decode(jsonStr)
        spriteName=string.sub(spriteName,1,#spriteName-5)
        self[spriteName] = Sprite.new()
        self[spriteName].currentTime=0
        self[spriteName].duration=1
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



