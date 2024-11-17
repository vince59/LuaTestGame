-- global Characters table

local Character = require("character")
local json = require "json"

Characters = {}

function Characters:load()
    local charactersFile = io.open("data/characters.json", "r")
    local jsonStr = charactersFile:read("*all")
    local data = json.decode(jsonStr)
    for character, values in pairs(data) do
        self[character] = Character.new()
        self[character].currentTime = 0
        self[character].duration = 1
        for field, value in pairs(values) do
            self[character][field] = value
        end
    end
end
