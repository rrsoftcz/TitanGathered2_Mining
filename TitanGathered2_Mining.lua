TITAN_ORES_ID = "Mining"
tgoPluginDb = {}

TitanGathered2_Mining = {}
-- Reduce the chance of functions and variables colliding with another addon.
local tgo = TitanGathered2_Mining
local infoBoardData = {}
local tg = TitanGathered2
local gtt = GameTooltip

tgo.id = TITAN_ORES_ID
tgo.addon = "TitanGathered2_Mining"
tgo.email = "bajtlamer@gmail.com"
tgo.www = "www.rrsoft.cz"

--  Get data from the TOC file.
tgo.version = tostring(GetAddOnMetadata(tgo.addon, "Version")) or "Unknown"
tgo.author = tostring(GetAddOnMetadata(tgo.addon, "Author")) or "Unknown"


for _, _category in pairs(TGO_PLUGIN_CATEGORIES) do
    table.insert(TG_CATEGORIES, _category)
end


function tgo.Button_OnLoad(self)
	echo(tgo.addon.." ("..TitanUtils_GetGreenText(tgo.version).."|cffff8020) loaded! Created By "..tgo.author)

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
    self:RegisterEvent("LOOT_OPENED")
    tgo.registerPlugin()
    tgo.registerPluginMinable()
end

function tgo.registerPlugin()
    table.insert(tgPlugins, tgo)
end

function tgo.registerPluginMinable()
    for _, _m in pairs(TGO_MINABLES)do
        table.insert(TG_MINABLES, _m)
    end
end

-- Event
function tgo.Button_OnEvent(self, event)
    -- EMPTY
end

function tgo.getGatherableSourceObject(objectId)
    for _, _m in pairs(TGO_MINABLES) do
        if (_m.id == objectId) then
            return { id = _m.id, name = _m.name }
        end
    end
    return {id = objectId, name = nil}
end
