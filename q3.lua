-- function remove_player_from_party(...) ?
function do_sth_with_PlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(membername) then-- change 'Player(membername)' to 'player'?
            party:removeMember(Player(membername))-- change 'Player(membername)' to 'player'?
        end
    end
end
