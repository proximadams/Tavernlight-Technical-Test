local <const> DELAY_MS = 1000
local <const> PLAYER_INDEX = 1000

local validatePlayer(player)
    local isValid = (player and type(player.setStorageValue) == "function" and type(player.getStorageValue) == "function")
    assert(isValid, "Invalid player. Does not have getter and setter storage functions")

local function releaseStorage(player)
    validatePlayer(player)
    player:setStorageValue(PLAYER_INDEX, -1)
end

function onLogout(player)
    validatePlayer(player)
    if player:getStorageValue(PLAYER_INDEX) == 1 then
        addEvent(releaseStorage, DELAY_MS, player)
    end
    return true
end
