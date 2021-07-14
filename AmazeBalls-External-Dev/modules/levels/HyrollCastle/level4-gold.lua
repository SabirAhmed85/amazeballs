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
    newShape("backFire", "backFire1_1_1", {1, 1, 1, 1})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 4, 1})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 2}, "up")
    newShape("shape", "triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    newShape("backFire", "backFire2_1_1", {1, 1, 7, 2})
    newTransition("backFire2_1_1", "slide", {}, {{1,1,7,2},{1,1,7,3}})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 3}, "triangleBottomRightShape")
    newShape("shape", "bar1_1_1", {1, 1, 4, 3}, "bar", {"vert", 3})
    newShape("shape", "triangle3_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 4, 4}, "right")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,4,3},{1,1,4,4}})
    newShape("door", "door1_1_1", {1, 1, 1, 5}, "down")
    newShape("door", "door2_1_1", {1, 1, 3, 5}, "down")
    newShape("door", "door3_1_1", {1, 1, 5, 5}, "down")
    newShape("door", "door4_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 1, 1}, "up")
    newShape("door", "door2_1_2", {1, 2, 3, 1}, "up")
    newShape("door", "door3_1_2", {1, 2, 4, 1}, "up")
    newShape("door", "door4_1_2", {1, 2, 5, 1}, "up")
    newShape("door", "door5_1_2", {1, 2, 6, 1, "up", "disabled"})
    newShape("door", "door6_1_2", {1, 2, 7, 1}, "up")
    newShape("shape", "triangle1_1_2", {1, 2, 5, 2}, "bar", {"horz", 3})
    newShape("shape", "triangle2_1_2", {1, 2, 6, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("shape", "triangle3_1_2", {1, 2, 2, 3}, "triangleTopLeftShape")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 4, 3}, "right")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,4,3},{1,2,5,3}})
    newShape("shape", "triangle4_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newShape("shape", "triangle5_1_2", {1, 2, 3, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle6_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle7_1_2", {1, 2, 2, 5}, "triangleBottomRightShape")
    newShape("manualFan", "manualFan1_1_2", {1, 2, 4, 5}, "up")
    newShape("shape", "triangle8_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, 13})
    newShape("shape", "triangle9_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 4, 5}, { {"door-open", "door5_1_2"} })

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "redCoin", {1, 2, 6, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 7, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 4, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 1, 3}, 75)
    newShape("item", "coins", {1, 2, 3, 2}, 60)
    newShape("item", "coins", {1, 2, 7, 3}, 45)
    newShape("item", "coins", {1, 1, 5, 5}, 175)
    newShape("item", "small-present", {1, 2, 7, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
