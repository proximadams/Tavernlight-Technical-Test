-- are setStorageValue and getStorageValue TFS & OTC only?
-- onLogout() returns true before releaseStorage() is actually called. addEvent has delay of 1000. Yield/await maybe?

local <const> DELAY_MS = 1000
local <const> PLAYER_INDEX = 1000

local function releaseStorage(player)
    player:setStorageValue(PLAYER_INDEX, -1)
end

function onLogout(player)
    if player:getStorageValue(PLAYER_INDEX) == 1 then
        addEvent(releaseStorage, DELAY_MS, player)
    end
    return true
end
