local <const> DELAY_MS = 1000
local <const> PLAYER_INDEX = 1000

local isValidPlayer(player)
    return (player and type(player.setStorageValue) == 'function' and type(player.getStorageValue) == 'function')

local function releaseStorage(player)
    assert(isValidPlayer(player), 'Invalid player. Does not have getter and setter storage functions')
    player:setStorageValue(PLAYER_INDEX, -1)
end

function onLogout(player)
    assert(isValidPlayer(player), 'Invalid player. Does not have getter and setter storage functions')
    if player:getStorageValue(PLAYER_INDEX) == 1 then
        addEvent(releaseStorage, DELAY_MS, player)
    end
    return true
end
