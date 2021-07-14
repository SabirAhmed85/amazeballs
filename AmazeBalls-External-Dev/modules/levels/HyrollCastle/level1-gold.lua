local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local newShape = function(type, name, location, subType, props)
        addToShapeArray(shapeArrayParameters, type, name, location, subType, props);
    end
    local newTransition = function(shapeName, transitionType, props, positionArray)
        addToTransitionArray(mainFunc.allLevelSettings.transitionArrayIndex, shapeArrayParameters, shapeName, transitionType, props, positionArray);
    end

    --SCREEN 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 6, 1}, "up")
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 2}, "down")
    newShape("shape", "triangle2_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape")
    newShape("shape", "bar1_1_1", {1, 1, 6, 2}, "bar", {"vert", 4})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 6, 3}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")
    newShape("shape", "triangle3_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 5, 5}, "up")
    newTransition("autoFan2_1_1", "switchSlide", {labelled = false}, {{1,1,5,4},{1,1,5,5}})
    newShape("shape", "bar2_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    newShape("endPoint", "endPoint1_2_1", {2, 1, 1, 2})
    newShape("shape", "bar1_2_1", {2, 1, 3, 2}, "bar", {"vert", 2})
    newShape("shape", "bar2_2_1", {2, 1, 6, 2}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 2, 3}, "down")
    newShape("manualFan", "manualFan2_2_1", {2, 1, 3, 3}, "down")
    newShape("manualFan", "manualFan3_2_1", {2, 1, 4, 3}, "up")
    newShape("manualFan", "manualFan4_2_1", {2, 1, 6, 3}, "up")
    newTransition("manualFan4_2_1", "slide", {}, {{2,1,6,3},{2,1,6,4}})
    newShape("manualFan", "manualFan5_2_1", {2, 1, 7, 3}, "left")
    newTransition("manualFan5_2_1", "slide", {}, {{2,1,5,1},{2,1,5,2},{2,1,6,2},{2,1,7,3}})
    newShape("shape", "bar3_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})
    newShape("shape", "triangle1_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, 6})
    newTransition("triangle1_2_1", "slide", {}, {{2,1,3,5},{2,1,4,4}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 5, 5}, "up")

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 3, 4}, { {"slide", "autoFan2_1_1"} }, {"one-way", "not-labelled"})
    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 4}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 3, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 2, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 7, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 6, 4}, 80)
    newShape("item", "coins", {1, 1, 6, 2}, 80)
    newShape("item", "coins", {2, 1, 3, 2}, 12)
    newShape("item", "small-present", {2, 1, 2, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
