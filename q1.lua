-- to improve readability and ease of use, I turn the "magic numbers" into constants
local <const> DELAY_MS = 1000
local <const> PLAYER_INDEX = 1000

local validatePlayer(player)
    local isValid = (player and type(player.setStorageValue) == "function" and type(player.getStorageValue) == "function")
    assert(isValid, "Invalid player. Does not have getter and setter storage functions")

local function releaseStorage(player)
    -- validatePlayer(player) call is defensive programming
    -- I'm assuming the code calling releaseStorage could possibly pass an invalid parameter
    validatePlayer(player)
    player:setStorageValue(PLAYER_INDEX, -1)
end

function onLogout(player)
    -- validatePlayer(player) call is defensive programming
    -- I'm assuming the code calling onLogout could possibly pass an invalid parameter
    validatePlayer(player)
    if player:getStorageValue(PLAYER_INDEX) == 1 then
        addEvent(releaseStorage, DELAY_MS, player)
    end
    return true
end
