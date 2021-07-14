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
    newShape("autoFan","autoFan1_1_1", {1, 1, 4, 1}, "down")
    newShape("manualFan","manualFan1_1_1", {1, 1, 6, 1}, "down")
    newShape("manualFan","manualFan2_1_1", {1, 1, 1, 2}, "down")
    newShape("manualFan","manualFan3_1_1", {1, 1, 4, 2}, "left")
    newShape("shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"horz", 4})
    newShape("manualFan","manualFan4_1_1", {1, 1, 5, 2}, "right")
    newShape("autoFan","autoFan2_1_1", {1, 1, 2, 4}, "right")
    newTransition("autoFan2_1_1", "slide", {"orange"}, {{1,1,1,4},{1,1,2,4}})
    newShape("shape","triangle1_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door","door1_1_1", {1, 1, 7, 4}, "right")
    newShape("door","door2_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("autoFan","autoFan1_2_1", {2, 1, 4, 1}, "left")
    newShape("backFire","backFire1_2_1", {2, 1, 7,1})
    newShape("simple","simple1_2_1", {2, 1, 5, 2})
    newTransition("simple1_2_1", "autoSlide", {timePerSquare = 360, pauseTime = 2000, labelled = false}, {{2,1,5,2},{2,1,5,4}})
    newShape("shape","bar1_2_1", {2, 1, 8, 1}, "bar", {"horz"})
    newTransition("bar1_2_1", "autoSlide", {timePerSquare = 220, pauseTime = 20}, {{2,1,8,1},{2,1,8,2}})
    newShape("shape","bar2_2_1", {2, 1, 6, 3}, "bar", {"vert", 3})
    newShape("shape","bar3_2_1", {2, 1, 6, 3}, "bar", {"horz", 2})
    newShape("simple","simple1_2_1", {2, 1, 1, 4})
    newTransition("simple1_2_1", "slide", {"lightBlue"}, {{2,1,1,4},{2,1,1,5}})
    newShape("shape","triangle1_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("shape","bar4_2_1", {2, 1, 6, 4}, "bar", {"horz", 2})
    newShape("autoFan","autoFan2_2_1", {2, 1, 6, 4}, "up")
    newTransition("autoFan2_2_1", "slide", {"orange"}, {{2,1,6,4},{2,1,7,3}})
    newShape("door","door2_2_1", {2, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("shape","bar1_1_2", {1, 2, 1, 2}, "bar", {"vert", 3})
    newShape("shape","bar2_1_2", {1, 2, 2, 2}, "bar", {"horz", 3})
    newShape("manualFan","manualFan1_1_2", {1, 2, 3, 2}, "down")
    newShape("autoFan","autoFan2_1_2", {1, 2, 6, 2}, "left")
    newShape("manualFan","manualFan3_1_2", {1, 2, 1, 3}, "right")
    newShape("door","door1_1_2", {1, 2, 7, 3}, "right")
    newShape("shape","triangle1_1_2", {1, 2, 1, 4}, "triangleTopLeftShape")
    newTransition("triangle1_1_2", "slide", {"green"}, {{1,2,1,4},{1,2,1,5}})
    newShape("manualFan","manualFan4_1_2", {1, 2, 3, 4}, "right")
    newShape("endPoint","endPoint1_1_2", {1, 2, 5, 4})
    newShape("shape","bar3_1_2", {1, 2, 3, 5}, "bar", {"horz", 2})
    newShape("manualFan","manualFan5_1_2", {1, 2, 3, 5}, "right")
    newShape("shape","bar4_1_2", {1, 2, 3, 6}, "bar", {"vert", 2})
    newShape("shape","bar5_1_2", {1, 2, 6, 5}, "bar", {"horz", 2})
    newTransition("bar5_1_2", "slide", {"brown"}, {{1,2,6,3},{1,2,6,5}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
