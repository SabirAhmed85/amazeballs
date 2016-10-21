-- Hide status bar
display.setStatusBar(display.HiddenStatusBar);

-- Initialize storyboard
local composer = require ("composer")
local widget = require("widget")
	
 
	
-- Function to save a table.&nbsp; Since game settings need to be saved from session to session, we will
	
-- use the Documents Directory
 
	
local json = require("json")--
	
function saveTable(t, filename)
	
    local path = system.pathForFile( filename, system.DocumentsDirectory)
	
    local file = io.open(path, "w")
	
    if file then
	
        local contents = json.encode(t)
	
        file:write( contents )
	
        io.close( file )
	
        return true
	
    else
	
        return false
	
    end
	
end
	
 
	
function loadTable(filename)
	
    local path = system.pathForFile( filename, system.DocumentsDirectory)
	
    local contents = ""
	
    local myTable = {}
	
    local file = io.open( path, "r" )
	
    if file then
	
         -- read all contents of file into a string
	
         local contents = file:read( "*a" )
	
         myTable = json.decode(contents);
	
         io.close( file )
	
         return myTable 
	
    end
	
    return nil
	
end

function xCalc(val)
    local newVal = (val/480) * display.contentWidth

    return newVal
end

function yCalc(val)
    local newVal = (val/320) * display.contentHeight

    return newVal
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

local iapAvail = false


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
    
    --There are no settings. This is the first time the user launches the game
    --Create the default settings

    myGameSettings  = gameSettingsConfigScript.createFreshGameSettings(levelConfigArray, characterConfigArray, itemConfigArray)
    myTotalToolArray  = gameSettingsConfigScript.createFreshToolArray(levelConfigArray)
    myTotalObjectArray  = gameSettingsConfigScript.createFreshObjectArray(levelConfigArray)
    
    saveTable(myGameSettings, "myGameSettings.json")
    saveTable(myTotalToolArray, "myTotalToolArray.json")
    saveTable(myTotalObjectArray, "myTotalObjectArray.json")

end

-- Load first scene
composer.gotoScene("TitleScreen")