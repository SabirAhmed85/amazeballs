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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleLeftAndRightShape", {1})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 2}, "right")
    newShape("shape", "triangle2_1_1", {1, 1, 3, 2}, "triangleLeftAndRightShape", {2})
    newShape("shape", "triangle3_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,5,2},{1,1,6,1}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 3}, "right")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 4, 3})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 6, 3}, "right")
    newTransition("manualFan2_1_1", "slide", {}, {{1,1,6,3},{1,1,6,4}})
    newShape("simple", "simple1_1_1", {1, 1, 3, 4})
    newTransition("simple1_1_1", "slide", {}, {{1,1,1,4},{1,1,2,4},{1,1,3,4}})
    newShape("shape", "triangle4_1_1", {1, 1, 4, 4}, "triangleTopAndBottomShape", {2})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 4, 5}, "down")
    newShape("manualFan", "manualFan3_1_1", {1, 1, 5, 5}, "up")

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle2_1_2", {1, 2, 4, 1}, "triangleTopAndBottomShape", {2})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 6, 1}, "left")
    newShape("shape", "bar1_1_2", {1, 2, 5, 3}, "bar", {"vert", 4})
    newTransition("bar1_1_2", "slide", {}, {{1,2,4,3},{1,2,5,3}})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 6, 3}, "up")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,3,5},{1,2,6,3}})
    newShape("shape", "triangle3_1_2", {1, 2, 4, 4}, "triangleTopRightShape")
    newShape("manualFan", "manualFan2_1_2", {1, 2, 5, 4}, "left")
    newShape("shape", "bar2_1_2", {1, 2, 3, 6}, "bar", {"vert", 2})

    --SWITCHES
    newShape("switch", "switch1_1_2", {1, 2, 3, 2}, { {"flip-horizontal", "triangle1_1_2"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 4, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 4, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "small-present", {1, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
