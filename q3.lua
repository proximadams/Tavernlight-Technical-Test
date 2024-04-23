
function removeMemberFromParty(playerId, membername)
    local player = Player(playerId)
    local party = player:getParty()
    local memberToRemove = Player(membername)

    for memberKey,memberValue in pairs(party:getMembers()) do
        if memberValue == memberToRemove then
            party:removeMember(memberToRemove)
        end
    end
end
