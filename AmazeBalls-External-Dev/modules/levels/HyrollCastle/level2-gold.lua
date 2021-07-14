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
    newShape("shape", "bar1_1_1", {1, 1, 2, 1}, "bar", {"vert"})
    newShape("shape", "triangle1_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,5,1},{1,1,6,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,1,1},{1,1,1,2}})
    newShape("shape", "bar2_1_1", {1, 1, 2, 2}, "bar", {"horz", 3})
    newShape("shape", "bar3_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    newShape("shape", "triangle3_1_1", {1, 1, 1, 4}, "triangleTopRightShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,1,3},{1,1,1,4}})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 4}, "up")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,2,2},{1,1,3,2},{1,1,2,4}})
    newShape("shape", "bar4_1_1", {1, 1, 3, 4}, "bar", {"horz", 2})
    newShape("shape", "bar5_1_1", {1, 1, 5, 4}, "bar", {"horz", 2})
    newShape("door", "door1_1_1", {1, 1, 2, 5}, "down")
    newShape("backFire", "backFire1_1_1", {1, 1, 3, 5})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,3,5},{1,1,5,5}})
    newShape("shape", "triangle4_1_1", {1, 1, 7, 5}, "triangleTopLeftShape")
    newTransition("triangle4_1_1", "slide", {}, {{1,1,4,3},{1,1,7,3},{1,1,7,5}})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 7, 1}, "down")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,7,1},{1,2,7,2}})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 3, 2}, "right")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,2,3},{1,2,3,3},{1,2,3,2}})
    newShape("shape", "bar1_1_2", {1, 2, 6, 2}, "bar", {"horz", 2})
    newShape("backFire", "backFire1_1_2", {1, 2, 1, 4})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,1,1},{1,2,1,4}})
    newShape("shape", "bar2_1_2", {1, 2, 4, 4}, "bar", {"horz", 2})
    newShape("backFire", "backFire2_1_2", {1, 2, 6, 4})
    newTransition("backFire2_1_2", "slide", {}, {{1,2,5,3},{1,2,6,3},{1,2,6,4},{1,2,7,4}})
    newShape("backFire", "backFire3_1_2", {1, 2, 4, 5})
    newTransition("backFire3_1_2", "slide", {}, {{1,2,4,4},{1,2,4,5}})
    newShape("shape", "bar3_1_2", {1, 2, 6, 5}, "bar", {"horz", 2})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 6, 5}, "right")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,6,5},{1,2,7,5}})
    newShape("shape", "bar4_1_2", {1, 2, 7, 5}, "bar", {"vert", 2})
    newShape("door", "door1_1_2", {1, 2, 7, 5}, "right")


    --SCREEN 2-2
    newShape("shape", "triangle1_2_2", {2, 2, 4, 1}, "triangleBottomRightShape", {1, 9})
    newShape("shape", "bar1_2_2", {2, 2, 7, 1}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan1_2_2", {2, 2, 7, 1}, "left")
    newShape("shape", "triangle2_2_2", {2, 2, 2, 2}, "triangleBottomRightShape")
    newShape("shape", "bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    newShape("manualFan", "manualFan2_2_2", {2, 2, 7, 2}, "down")
    newShape("shape", "triangle3_2_2", {2, 2, 3, 3}, "triangleBottomRightShape", {1, 9})
    newShape("manualFan", "manualFan3_2_2", {2, 2, 7, 3}, "right")
    newShape("shape", "triangle4_2_2", {2, 2, 5, 4}, "triangleBottomRightShape")
    newShape("manualFan", "manualFan4_2_2", {2, 2, 7, 4}, "up")
    newShape("backFire", "backFire1_2_2", {2, 2, 1, 5})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 2, 5}, "up")
    newTransition("autoFan1_2_2", "slide", {}, {{2,2,2,5},{2,2,3,5},{2,2,4,5},{2,2,5,5}})
    newShape("endPoint", "endPoint1_2_2", {2, 2, 7, 5})

    --GEMS  
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "purple", {2, 2, 3, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 2, 4, 2}, "purple")
    newShape("gem", "purple", {2, 2, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 3}, "purple")
    newShape("gem", "purple", {2, 2, 4, 3}, "purple")
    newShape("gem", "purple", {2, 2, 6, 3}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "purple", {2, 2, 6, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 4, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 3, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 2, 5, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 2, 5, 1}, 225)
    newShape("item", "coins", {2, 2, 2, 3}, 145)
    newShape("item", "coins", {1, 2, 4, 1}, 130)
    newShape("item", "coins", {1, 1, 7, 1}, 80)
    newShape("item", "clock", {1, 2, 4, 2, "clock1_1_1", 10, 1})
    newShape("item", "big-present", {2, 2, 6, 4}, {})
    newShape("item", "small-present", {1, 1, 7, 2}, {})
    newShape("item", "small-present", {2, 2, 3, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
