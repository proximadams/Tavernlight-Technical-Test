-- db.storeQuery TFS & OTC only

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;" -- need single quotes around 'name' and 'guilds' maybe?
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount)) -- string.format safe from injection?
    local guildName = result.getString("name")
    print(guildName)
end
