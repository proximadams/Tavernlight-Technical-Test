
function removeMemberFromParty(playerId, membername)
    local player = Player(playerId)
    local party = player:getParty()
    local memberToRemove = Player(membername)-- Avoids running Player(membername) code twice

    -- k and v variable names are not very descriptive so I changed them
    for memberKey,memberValue in pairs(party:getMembers()) do
        if memberValue == memberToRemove then
            party:removeMember(memberToRemove)
        end
    end
end
