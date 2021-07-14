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
    newShape("shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz", 3})
    newShape("shape","bar2_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    newShape("manualFan","manualFan1_2_1", {1, 1, 2, 1}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","bar3_1_1", {1, 1, 1, 2}, "bar", {"horz", 3})
    newShape("shape","triangle2_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","bar4_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    newShape("manualFan","manualFan1_2_1", {1, 1, 2, 3}, "up")
    newShape("shape","triangle3_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape")
    newShape("shape","bar5_1_1", {1, 1, 2, 4}, "bar", {"horz"})
    newTransition("bar4_1_1", "slide", {}, {{1,1,2,2},{1,1,2,4}})
    newShape("shape","triangle4_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 2, 5})
    newShape("spitter","spitter1_1_1", {1, 1, 6, 5, "up","none","none","none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,4,5},{1,1,5,5},{1,1,6,5},{1,1,7,5}})

    --SCREEN 2-1
    newShape("tunnel","tunnel1_2_1", {2, 1, 1, 1, 2, 1, 7, 4, "none"})
    newShape("shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"vert", 3})
    newShape("manualFan","manualFan1_2_1", {2, 1, 2, 1}, "right")
    newShape("shape","bar2_2_1", {2, 1, 8, 1}, "bar", {"horz", 2})
    newShape("shape","bar3_2_1", {2, 1, 4, 2}, "bar", {"horz", 3})
    newShape("shape","triangle1_2_1", {2, 1, 5, 2}, "triangleBottomRightShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,5,1},{2,1,5,2}})
    newShape("shape","triangle2_2_1", {2, 1, 7, 2}, "triangleBottomLeftShape")
    --newShape("timeOut","timeOut1_2_1", {2, 1, 2, 3})
    newShape("door","door1_2_1", {2, 1, 1, 5}, "left")
    newShape("autoFan","autoFan1_2_1", {2, 1, 3, 5}, "left")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,3,5},{2,1,5,5}})
    newShape("shape","bar4_2_1", {2, 1, 5, 6}, "bar", {"vert", 2})

    --SCREEN 2-2
    newShape("door","door1_2_2", {2, 2, 2, 1}, "up")
    newShape("shape","triangle1_2_2", {2, 2, 2, 1}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("shape","triangle2_2_2", {2, 2, 3, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle3_2_2", {2, 2, 5, 2}, "triangleTopLeftShape")
    newTransition("triangle3_2_2", "flip-vertical")
    newShape("shape","triangle4_2_2", {2, 2, 3, 3}, "triangleBottomRightShape", {1, 9})
    newShape("manualFan","manualFan1_2_2", {2, 2, 1, 4}, "up")
    newTransition("manualFan1_2_2", "slide", {}, {{2,2,1,4},{2,2,1,5}})
    newShape("autoFan","autoFan1_2_2", {2, 2, 2, 5}, "left")
    newTransition("autoFan1_2_2", "slide", {}, {{2,2,2,5},{2,2,4,5},{2,2,5,5}})

    --SCREEN 2-3
    newShape("gem","purple", {2, 3, 1, 1}, "purple")
    --newShape("item","coins", {2, 3, 2, 1}, 250)
    newShape("gem","redCoin", {2, 3, 3, 1}, "redCoin")
    newShape("shape","triangle1_2_3", {2, 3, 4, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_2_3", {2, 3, 5, 1}, "triangleBottomLeftShape")
    newShape("door","door1_2_3", {2, 3, 7, 1}, "up")
    newShape("spitter","spitter1_2_3", {2, 3, 7, 1, "up","none","none","none"})
    newShape("autoFan","autoFan1_2_3", {2, 3, 2, 2}, "right")
    newShape("manualFan","manualFan1_2_3", {2, 3, 7, 2}, "up")
    newShape("shape","bar1_2_3", {2, 3, 8, 2}, "bar", {"horz", 2})
    newShape("shape","triangle3_2_3", {2, 3, 1, 3}, "triangleBottomRightShape")
    newShape("manualFan","manualFan2_2_3", {2, 3, 3, 3}, "up")
    newShape("shape","triangle4_2_3", {2, 3, 4, 3}, "triangleTopLeftShape", {1, 15})
    newTransition("triangle4_2_3", "flip-vertical")
    newShape("shape","bar2_2_3", {2, 3, 5, 3}, "bar", {"horz", 4})
    newShape("manualFan","manualFan3_2_3", {2, 3, 6, 3}, "right")
    newShape("shape","triangle5_2_3", {2, 3, 7, 3}, "triangleBottomLeftShape")
    newShape("shape","triangle6_2_3", {2, 3, 1, 4}, "triangleTopRightShape")
    newShape("manualFan","manualFan4_2_3", {2, 3, 2, 4}, "down")
    newShape("shape","bar3_2_3", {2, 3, 5, 4}, "bar", {"horz", 4})
    newShape("shape","triangle7_2_3", {2, 3, 5, 4}, "triangleBottomRightShape", {1, 14})
    newTransition("triangle7_2_3", "flip-vertical")
    newShape("shape","triangle8_2_3", {2, 3, 7, 4}, "triangleTopLeftShape")
    newShape("autoFan","autoFan2_2_3", {2, 3, 3, 5}, "left")
    newShape("shape","triangle9_2_3", {2, 3, 4, 5}, "triangleTopRightShape")
    newShape("shape","triangle10_2_3", {2, 3, 5, 5}, "triangleTopLeftShape")

    --SCREEN 2-4
    newShape("door","door1_2_4", {2, 4, 6, 1}, "up")
    newShape("simple","simple1_2_4", {2, 4, 6, 1})
    newShape("shape","triangle1_2_4", {2, 4, 1, 3}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("shape","triangle2_2_4", {2, 4, 2, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("characterChangePoint","characterChangePoint1_2_4", {2, 4, 6, 3})
    newShape("simple","simple2_2_4", {2, 4, 3, 5})
    newTransition("simple2_2_4", "slide", {}, {{2,4,1,5},{2,4,3,5}})
    newShape("spitter","spitter1_2_4", {2, 4, 6, 5, "up","none","none","none"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 2
t.screenVertTotal = 4
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
