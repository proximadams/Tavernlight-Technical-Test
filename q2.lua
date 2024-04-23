
function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    -- prints all guilds, not just the first one
    if resultId != nil then
        local guildName = result.getString(resultId, "name")
        while guildName do
            print(guildName)
            if not result.next(resultId) then
                break
            end
            guildName = result.getString(resultId, "name")
        end
    end
end
