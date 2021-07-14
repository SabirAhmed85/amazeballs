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
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 3}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 4, 3}, "bar", {"horz", 4})
    newTransition("bar1_1_1", "slide", {}, {{1,1,4,3},{1,1,4,5}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 5, 3}, "down")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 2, 5}, "up")
    newShape("manualFan", "manualFan2_1_1", {1, 1, 5, 5}, "left")
    newShape("door", "door1_1_1", {1, 1, 5, 5, "down", "disabled"})

    --SCREEN 1-2
    newShape("manualFan", "manualFan1_1_2", {1, 2, 5, 1}, "down")
    newShape("shape", "bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 2})
    newShape("manualFan", "manualFan2_1_2", {1, 2, 7, 1}, "right")
    newShape("shape", "triangle1_1_2", {1, 2, 2, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 5, 2}, "left")
    newShape("shape", "triangle2_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 2, 4}, "right")
    newShape("autoFan", "autoFan3_1_2", {1, 2, 5, 5}, "up")
    newTransition("autoFan3_1_2", "switchSlide", {labelled = false}, {{1,2,5,4},{1,2,5,5}})
    newShape("manualFan", "manualFan3_1_2", {1, 2, 7, 5}, "right")
    newShape("door", "door1_1_2", {1, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 2-2
    newShape("shape", "triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape")
    newShape("shape", "triangle2_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape")
    newShape("simple", "simple1_2_2", {2, 2, 3, 3})
    newShape("shape", "triangle3_2_2", {2, 2, 1, 5}, "triangleTopLeftShape")
    newShape("endPoint", "endPoint1_2_2", {2, 2, 3, 5})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 2, 4}, { {"door-open", "door1_1_1"} })

    newShape("switch", "switch1_1_2", {1, 2, 2, 1}, { {"door-open", "door1_1_2"} }, {"one-way"})
    newShape("switch", "switch2_1_2", {1, 2, 3, 4}, { {"slide", "autoFan3_1_2"} }, {"one-way", "not-labelled"})
    --GEMS
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 5}, "purple")
    newShape("gem", "purple", {2, 2, 4, 5}, "purple")
    newShape("gem", "purple", {2, 2, 6, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {2, 2, 2, 2}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "redCoin", {1, 2, 1, 3}, "redCoin")
    newShape("gem", "blueCoin", {2, 2, 5, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 4, 4}, "purpleCoin")

    newShape("item", "coins", {1, 1, 1, 1}, 115)
    newShape("item", "coins", {2, 2, 7, 5}, 295)
    newShape("item", "small-present", {1, 2, 1, 1}, {})

    newShape("item", "big-present", {2, 2, 3, 1}, {})

    newShape("item", "hook", {1, 1, 4, 1}, {})

    newShape("item", "bomb", {1, 2, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
