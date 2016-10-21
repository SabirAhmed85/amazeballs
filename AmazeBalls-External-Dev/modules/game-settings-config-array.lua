local t = {}

local createFreshGameSettings = function (levelConfigArray, characterConfigArray, itemConfigArray)

	myGameSettings = {}

    myGameSettings["worldSelectLastWorld"] = nil

    myGameSettings["total_lives"] = 2
    myGameSettings["current_max_lives"] = 3
    myGameSettings["total_max_lives"] = 5

    myGameSettings["total_coins"] = 50000

    myGameSettings["gems_discovered_first"] = true -- should be false
    myGameSettings["gems_discovered_second"] = true -- should be false

    myGameSettings["coins_discovered_first"] = false
    myGameSettings["coins_discovered_second"] = false

    myGameSettings["toolsDiscovered"] = true -- should be FALSE
    myGameSettings["shapesDiscovered"] = false

    myTotalToolArray = {}
    myTotalObjectArray = {}

    myGameSettings["itemDiscovered"] = {}
    myGameSettings["tutorialDone"] = {}
    myGameSettings["voucherGained"] = {}
    for a = 1, #itemConfigArray do
        myGameSettings["itemDiscovered"][itemConfigArray[a]] = true -- should be FALSE
        myGameSettings["voucherGained"][itemConfigArray[a]] = false
        myGameSettings["tutorialDone"][itemConfigArray[a]] = true -- should be FALSE
        if itemConfigArray[a] == "triangle" then
            myGameSettings["tutorialDone"][itemConfigArray[a]] = false
        end
    end

    myGameSettings["characterUnlocked"] = {}
    for a = 1, #characterConfigArray do
        myGameSettings["characterUnlocked"][characterConfigArray[a]] = true
    end


    myGameSettings["worldUnlocked"] = {}

    for key, val in pairs(levelConfigArray) do
    	myGameSettings[key] = {}
        myGameSettings["worldUnlocked"][key] = true -- should be FALSE
        if key == "WoodyWalk" then
            myGameSettings["worldUnlocked"][key] = true
        end
    	myGameSettings[key]["levels"] = {}

    	totalLevels = 0
    	for secondKey, secondVal in pairs (levelConfigArray[key]) do
    		totalLevels = totalLevels + 1
    	end
    	for a = 1, totalLevels do
			myGameSettings[key]["levels"][a] = {}
			myGameSettings[key]["levels"][a]["intro_complete"] = false
			myGameSettings[key]["levels"][a]["silver_gained"] = false
            myGameSettings[key]["levels"][a]["gold_gained"] = false

			myGameSettings[key]["levels"][a]["silver-achievements"] = {}
			myGameSettings[key]["levels"][a]["gold-achievements"] = {}

            myGameSettings[key]["levels"][a]["silver-achievements"]["level_attempted"] = false
			myGameSettings[key]["levels"][a]["silver-achievements"]["purple_gems"] = 0
            myGameSettings[key]["levels"][a]["silver-achievements"]["gems_gained_array"] = {}
			myGameSettings[key]["levels"][a]["silver-achievements"]["red_coin"] = 0
			myGameSettings[key]["levels"][a]["silver-achievements"]["blue_coin"] = 0
			myGameSettings[key]["levels"][a]["silver-achievements"]["purple_coin"] = 0
            myGameSettings[key]["levels"][a]["silver-achievements"]["map_obtained"] = false
            myGameSettings[key]["levels"][a]["silver-achievements"]["compass_obtained"] = false
            myGameSettings[key]["levels"][a]["silver-achievements"]["best_time_seconds_left"] = 0
            myGameSettings[key]["levels"][a]["silver-achievements"]["first_time_seconds_left"] = 0
            myGameSettings[key]["levels"][a]["silver-achievements"]["mystery_shapes_to_add"] = {}

            myGameSettings[key]["levels"][a]["gold-achievements"]["level_attempted"] = false
			myGameSettings[key]["levels"][a]["gold-achievements"]["purple_gems"] = 0
            myGameSettings[key]["levels"][a]["gold-achievements"]["gems_gained_array"] = {}
			myGameSettings[key]["levels"][a]["gold-achievements"]["red_coin"] = 0
			myGameSettings[key]["levels"][a]["gold-achievements"]["blue_coin"] = 0
			myGameSettings[key]["levels"][a]["gold-achievements"]["purple_coin"] = 0
            myGameSettings[key]["levels"][a]["gold-achievements"]["map_obtained"] = false
            myGameSettings[key]["levels"][a]["gold-achievements"]["compass_obtained"] = false
            myGameSettings[key]["levels"][a]["gold-achievements"]["best_time_seconds_left"] = 0
            myGameSettings[key]["levels"][a]["gold-achievements"]["first_time_seconds_left"] = 0
            myGameSettings[key]["levels"][a]["gold-achievements"]["mystery_shapes_to_add"] = {}
	    end

    end

    return myGameSettings
end
    t.createFreshGameSettings = createFreshGameSettings

local createFreshToolArray = function (levelConfigArray)

    myTotalToolArray = {}

    return myTotalToolArray
end
    t.createFreshToolArray = createFreshToolArray

local createFreshObjectArray = function (levelConfigArray)

    myTotalObjectArray = {}

    return myTotalObjectArray
end
    t.createFreshObjectArray = createFreshObjectArray

return t
