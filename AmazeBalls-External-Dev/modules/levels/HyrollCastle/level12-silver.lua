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
    newShape("backFire", "backFire1_1_1", {1, 1, 2, 1})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,1,1},{1,1,2,1},{1,1,3,1}})
    newShape("shape", "bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 4})
    newShape("backFire", "backFire2_1_1", {1, 1, 7, 1})
    newTransition("backFire2_1_1", "slide", {}, {{1,1,5,1},{1,1,7,1}})
    newShape("shape", "bar2_1_1", {1, 1, 6, 1}, "bar", {"vert", 2})
    newShape("simple", "simple1_1_1", {1, 1, 5, 2})
    newTransition("simple1_1_1", "slide", {}, {{1,1,4,2},{1,1,5,2},{1,1,5,3,"*"},{1,1,6,3}})
    newShape("simple", "simple2_1_1", {1, 1, 6, 4})
    newTransition("simple2_1_1", "slide", {}, {{1,1,3,4},{1,1,6,4}})
    newShape("shape", "bar3_1_1", {1, 1, 6, 4}, "bar", {"vert", 4})
    newShape("shape", "bar4_1_1", {1, 1, 3, 5}, "bar", {"vert", 4})
    newShape("door", "door1_1_1", {1, 1, 1, 5}, "down")
    newShape("backFire", "backFire3_1_1", {1, 1, 4, 5})
    newTransition("backFire3_1_1", "slide", {}, {{1,1,3,5},{1,1,4,5},{1,1,6,5}})

    --SCREEN 1-2
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 1}, "right")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 2, 1}, "down")
    newShape("shape", "bar1_1_2", {1, 2, 6, 1}, "bar", {"vert", 4})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 6, 1}, "right")
    newShape("endPoint", "endPoint1_1_2", {1, 2, 5, 2})
    newShape("manualFan", "manualFan2_1_2", {1, 2, 6, 2}, "right")
    newShape("simple", "simple1_1_2", {1, 2, 3, 3})
    newTransition("simple1_1_2", "slide", {}, {{1,2,2,3},{1,2,3,3}})
    newShape("manualFan", "manualFan3_1_2", {1, 2, 6, 3}, "right")
    newShape("shape", "bar2_1_2", {1, 2, 2, 4}, "bar", {"vert", 4})
    newShape("backFire", "backFire1_1_2", {1, 2, 3, 4})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,2,4},{1,2,3,4}})
    newShape("shape", "triangle1_1_2", {1, 2, 4, 4}, "triangleTopRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,2,5},{1,2,4,5},{1,2,4,4}})
    newShape("autoFan", "autoFan3_1_2", {1, 2, 6, 5}, "up")

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 6, 2}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 7, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 2, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 4, 1}, 125)
    newShape("item", "coins", {1, 2, 3, 2}, 75)
    newShape("item", "clock", {1, 1, 2, 4, "clock1_1_1", 10, 1})
    newShape("item", "big-present", {1, 2, 5, 3}, {})
    newShape("item", "small-present", {1, 2, 7, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
