-- global TileBoard table

local TileBoard = require("tileBoard")
local json = require "json"

TileBoards = {}

function TileBoards:load()
    local tileBoardsFile = io.open("data/tileBoards.json", "r")
    local jsonStr = tileBoardsFile:read("*all")
    local tileBoards=json.decode(jsonStr)
    for tileBoardName, tileBoardValue in pairs(tileBoards) do
        local tileBoard=TileBoard.new()
        for paramName, paramValue in pairs(tileBoardValue) do
            tileBoard[paramName]=paramValue
        end
        tileBoard:load()
        self[tileBoardName]=tileBoard
    end
end