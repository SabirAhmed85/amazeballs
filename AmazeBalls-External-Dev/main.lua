-- Hide status bar
display.setStatusBar(display.HiddenStatusBar);

-- Initialize storyboard
local composer = require ("composer")
local json = require("json")
	
function saveTable(t, filename)
    local path = system.pathForFile(filename, system.DocumentsDirectory)
    local file = io.open(path, "w")
	
    if file then
        local contents = json.encode(t)
        file:write(contents)
        io.close(file)

        return true
    end
	
    return false
end

function loadTable(filename)
    local path = system.pathForFile(filename, system.DocumentsDirectory)
    local myTable = {}
    local file = io.open(path, "r")
	
    if file then
         local contents = file:read( "*a" );
         myTable = json.decode(contents);
         io.close(file);
	
         return myTable;
    end
	
    return nil;
end

function xCalc(val)
    return (val/480) * display.contentWidth
end

function yCalc(val)
    return (val/320) * display.contentHeight
end

function hasValue(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

myGameSettings = loadTable("myGameSettings.json")
myTotalToolArray = loadTable("myTotalToolArray.json")
musicChannel = {}

contentCentreX = display.contentWidth/2
contentCentreY = display.contentHeight/2

local levelConfigScript = require("modules.level-config-array")
    levelConfigArray = levelConfigScript.levelConfigArray
    characterConfigArray = levelConfigScript.characterConfigArray
    itemConfigArray = levelConfigScript.itemConfigArray
local gameSettingsConfigScript = require("modules.game-settings-config-array")

iapAvail = true

if( myGameSettings ) then
	--[[
	 myGameSettings  = gameSettingsConfigScript.createFreshGameSettings(levelConfigArray, characterConfigArray, itemConfigArray)
     myTotalToolArray  = gameSettingsConfigScript.createFreshToolArray(levelConfigArray)
     myTotalObjectArray  = gameSettingsConfigScript.createFreshObjectArray(levelConfigArray)
    
     saveTable(myGameSettings, "myGameSettings.json")
     saveTable(myTotalToolArray, "myTotalToolArray.json")
     saveTable(myTotalObjectArray, "myTotalObjectArray.json")
]]
else
    myGameSettings  = gameSettingsConfigScript.createFreshGameSettings(levelConfigArray, characterConfigArray, itemConfigArray)
    myTotalToolArray  = gameSettingsConfigScript.createFreshToolArray(levelConfigArray)
    myTotalObjectArray  = gameSettingsConfigScript.createFreshObjectArray(levelConfigArray)

    saveTable(myGameSettings, "myGameSettings.json")
    saveTable(myTotalToolArray, "myTotalToolArray.json")
    saveTable(myTotalObjectArray, "myTotalObjectArray.json")
end

composer.gotoScene("TitleScreen")