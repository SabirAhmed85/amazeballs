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
    newShape("endPoint","endPoint1_1_1", {1, 1, 1, 1})
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 1}, "right")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,2,1},{1,1,3,1}})
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,5,1},{1,1,5,2}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 3, 2}, "right")
    newShape("autoFan","autoFan3_1_1", {1, 1, 7, 2}, "down")
    newShape("autoFan","autoFan4_1_1", {1, 1, 3, 3}, "down")
    newShape("autoFan","autoFan5_1_1", {1, 1, 7, 3}, "left")
    newShape("shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 4})
    newTransition("bar1_1_1", "slide", {}, {{1,1,8,1},{1,1,8,3}})
    newShape("manualFan","manualFan2_1_1", {1, 1, 2, 4}, "up")
    newShape("manualFan","manualFan3_1_1", {1, 1, 3, 4}, "right")
    newShape("autoFan","autoFan6_1_1", {1, 1, 6, 4}, "up")
    newTransition("autoFan6_1_1", "slide", {}, {{1,1,6,2},{1,1,6,4}})
    newShape("autoFan","autoFan7_1_1", {1, 1, 1, 5}, "up")
    newShape("manualFan","manualFan4_1_1", {1, 1, 6, 5}, "left")

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape","triangle3_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape", {1, 3, "breakable"})
    newShape("shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("item","compass", {2, 1, 7, 4})
    newShape("autoFan","autoFan1_2_1", {2, 1, 4, 5}, "up")
    newShape("autoFan","autoFan2_2_1", {2, 1, 5, 5}, "left")

    --SCREEN 2-2
    newShape("shape","bar1_2_2", {2, 2, 3, 1}, "bar", {"horz", 2})
    newTransition("bar1_2_2", "slide", {}, {{2,2,3,1},{2,2,3,5}})
    newShape("shape","triangle1_2_2", {2, 2, 4, 1}, "triangleTopRightShape", {1, 13})
    newShape("door","door1_2_2", {2, 2, 5, 1}, "up")
    newShape("autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up")
    newTransition("autoFan1_2_2", "slide", {}, {{2,2,5,1},{2,2,6,1}})
    newShape("shape","triangle2_2_2", {2, 2, 7, 1}, "triangleBottomRightShape")
    newShape("autoFan","autoFan2_2_2", {2, 2, 7, 2}, "left")
    newTransition("autoFan2_2_2", "slide", {}, {{2,2,6,2},{2,2,7,2}})
    newShape("shape","triangle3_2_2", {2, 2, 1, 3}, "triangleBottomLeftShape")
    newShape("spitter","spitter1_2_2", {2, 2, 3, 3}, {"none","right","none","none"})
    newTransition("spitter1_2_2", "slide", {}, {{2,2,3,1},{2,2,3,3},{2,2,3,5}})
    newShape("shape","triangle4_2_2", {2, 2, 7, 3}, "triangleTopRightShape")
    newShape("autoFan","autoFan3_2_2", {2, 2, 4, 4}, "down")
    newShape("shape","triangle5_2_2", {2, 2, 7, 4}, "triangleBottomLeftShape")
    --newShape("timeOut","timeOut1_2_2", {2, 2, 1, 5, 5})
    newShape("shape","bar2_2_2", {2, 2, 6, 5}, "bar", {"horz", 4})
    newTransition("bar2_2_2", "slide", {}, {{2,2,6,4},{2,2,6,5}})
    newShape("shape","triangle6_2_2", {2, 2, 7, 5}, "triangleTopLeftShape")
    --newShape("timeOut","timeOut2_2_2", {2, 2, 5, 5, 3})

    --SCREEN 2-3
    newShape("door","door1_2_3", {2, 3, 1, 1}, "up")
    newShape("autoFan","autoFan1_2_3", {2, 3, 1, 1}, "up")
    newShape("autoFan","autoFan2_2_3", {2, 3, 3, 1}, "down")
    newShape("shape","triangle1_2_3", {2, 3, 4, 1}, "triangleBottomLeftShape")
    newShape("autoFan","autoFan3_2_3", {2, 3, 5, 1}, "down")
    newShape("shape","triangle2_2_3", {2, 3, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("autoFan","autoFan4_2_3", {2, 3, 7, 1}, "up")
    newShape("autoFan","autoFan5_2_3", {2, 3, 1, 2}, "up")
    newShape("autoFan","autoFan6_2_3", {2, 3, 3, 2}, "down")
    newShape("autoFan","autoFan7_2_3", {2, 3, 5, 2}, "down")
    newShape("autoFan","autoFan8_2_3", {2, 3, 7, 2}, "up")
    newShape("shape","triangle3_2_3", {2, 3, 4, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan9_2_3", {2, 3, 2, 4}, "down")
    newShape("autoFan","autoFan10_2_3", {2, 3, 3, 4}, "left")
    newShape("autoFan","autoFan11_2_3", {2, 3, 5, 4}, "right")
    newShape("autoFan","autoFan12_2_3", {2, 3, 7, 4}, "down")
    newShape("autoFan","autoFan13_2_3", {2, 3, 2, 5}, "right")
    newShape("autoFan","autoFan14_2_3", {2, 3, 3, 5}, "up")
    newTransition("autoFan14_2_3", "slide", {}, {{2,3,3,5},{2,3,4,4}})
    newShape("autoFan","autoFan15_2_3", {2, 3, 5, 5}, "up")
    newShape("autoFan","autoFan16_2_3", {2, 3, 7, 5}, "left")
    newShape("item","map", {2, 3, 6, 2})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
