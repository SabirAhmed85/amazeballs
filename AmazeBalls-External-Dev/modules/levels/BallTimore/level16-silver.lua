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
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert"})
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("gem","redCoin", {1, 1, 1, 2}, "redCoin")
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("shape","bar2_1_1", {1, 1, 5, 2}, "bar", {"vert"})
    newShape("item","map", {1, 1, 5, 2})
    newShape("gem","blueCoin", {1, 1, 6, 2}, "blueCoin")
    newShape("shape","triangle3_1_1", {1, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","bar3_1_1", {1, 1, 6, 3}, "bar", {"horz", 2})
    newShape("item","mystery-block", {1, 1, 6, 3}, {})

    newShape("door","door1_1_1", {1, 1, 7, 3}, "right", {"disabled"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 7, 4}, "left")
    newShape("door","door2_1_1", {1, 1, 1, 5}, "down")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("characterChangePoint","characterChangePoint1_1_1", {1, 1, 7, 5})

    --SCREEN 1-2
    newShape("simple","simple1_1_2", {1, 2, 1, 1})
    newShape("manualFan","manualFan1_1_2", {1, 2, 4, 1}, "left")
    newShape("shape","triangle4_1_2", {1, 2, 5, 1}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("door","door1_1_2", {1, 2, 6, 1}, "up")
    newShape("manualFan","manualFan2_1_2", {1, 2, 6, 1}, "down")
    newShape("shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 4})
    newTransition("bar1_1_2", "slide", {}, {{1,2,7,1},{1,2,7,2}})
    newShape("manualFan","manualFan3_1_2", {1, 2, 1, 2}, "right")
    newShape("shape","triangle4_1_2", {1, 2, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape","triangle4_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","bar2_1_2", {1, 2, 8, 2}, "bar", {"horz", 4})
    newTransition("bar2_1_2", "switchSlide", {}, {{1,2,8,1},{1,2,8,2}})
    newShape("shape","triangle4_1_2", {1, 2, 3, 3}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 3}, "up")
    newShape("shape","triangle4_1_2", {1, 2, 2, 4}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan2_1_2", {1, 2, 6, 4}, "right")
    newShape("manualFan","manualFan4_1_2", {1, 2, 1, 5}, "right")
    newShape("shape","triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("gem","redCoin", {1, 2, 5, 5}, "redCoin")
    newShape("shape","bar3_1_2", {1, 2, 1, 6}, "bar", {"vert", 2})
    newShape("shape","bar4_1_2", {1, 2, 4, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomRightShape")
    newShape("backFire","backFire1_2_1", {2, 1, 2, 3})
    newShape("shape","triangle2_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape")
    newShape("manualFan","manualFan1_2_1", {2, 1, 5, 3}, "up")
    newShape("endPoint","endPoint1_2_1", {2, 1, 7, 3})


    --SCREEN 3-2
    newShape("switch","switch1_1_2", {1, 2, 1, 3}, { {"door-open","door1_1_1"} })
    newShape("switch","switch2_1_2", {1, 2, 5, 3}, { {"slide","bar2_1_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
