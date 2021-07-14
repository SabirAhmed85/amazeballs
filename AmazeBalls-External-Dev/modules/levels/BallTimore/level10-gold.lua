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
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 1}, "up")
    newShape("manualFan","manualFan2_1_1", {1, 1, 4, 1}, "down")
    newShape("autoFan","autoFan3_1_1", {1, 1, 6, 1}, "left")
    newShape("manualFan","manualFan3_1_1", {1, 1, 1, 2}, "down")
    newTransition("manualFan4_1_1", "slide", {}, {{1,1,1,2},{1,1,3,2}})
    newShape("shape","bar2_1_1", {1, 1, 3, 2}, "bar", {"vert", 3})
    newShape("shape","bar3_1_1", {1, 1, 5, 2}, "bar", {"horz"})
    newShape("shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newTransition("triangle1_1_1", "switchSlide", {}, {{1,1,6,2},{1,1,6,3}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 2, 3}, "left")
    newShape("door","door1_1_1", {1, 1, 7, 3}, "right", {"disabled"})
    newShape("shape","bar4_1_1", {1, 1, 2, 4}, "bar", {"horz", 3})
    newShape("manualFan","manualFan4_1_1", {1, 1, 3, 4}, "up")
    --newShape("timeOut","timeOut1_1_1", {1, 1, 7, 4, 4})
    newShape("shape","triangle2_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    newShape("shape","bar5_1_1", {1, 1, 7, 5}, "bar", {"horz", 2})

    --SCREEN 2-1
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 3}, "down")
    newShape("door","door1_2_1", {2, 1, 1, 4}, "left")
    newShape("door","door2_2_1", {2, 1, 2, 5}, "down")

    --SCREEN 2-2
    newShape("shape","triangle1_2_2", {2, 2, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan1_2_2", {2, 2, 2, 2}, "right")
    newShape("manualFan","manualFan1_2_2", {2, 2, 5, 2}, "down")
    newShape("autoFan","autoFan2_2_2", {2, 2, 6, 2}, "down")
    newShape("shape","triangle2_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape")
    newTransition("triangle2_2_2", "slide", {}, {{2,2,7,1},{2,2,7,2}})
    newShape("door","door1_2_2", {2, 2, 1, 3}, "left")
    newShape("shape","triangle3_2_2", {2, 2, 3, 3}, "triangleBottomLeftShape", {1, 3, "breakable"})
    newShape("autoFan","autoFan3_2_2", {2, 2, 4, 3}, "left")
    newShape("gem","purple", {2, 2, 7, 3}, "purple")
    newShape("autoFan","autoFan4_2_2", {2, 2, 2, 4}, "down")
    newShape("manualFan","manualFan2_2_2", {2, 2, 4, 4}, "up")
    newShape("autoFan","autoFan5_2_2", {2, 2, 6, 4}, "right")
    newShape("manualFan","manualFan3_2_2", {2, 2, 7, 4}, "right")
    newShape("shape","bar1_2_2", {2, 2, 7, 6}, "bar", {"vert", 2})

    --SCREEN 3-1
    newShape("door","door1_3_1", {3, 1, 1, 1}, "left", {"disabled"})
    newShape("shape","triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape","triangle2_3_1", {3, 1, 3, 1}, "triangleBottomRightShape")
    newShape("shape","triangle3_3_1", {3, 1, 4, 1}, "triangleBottomLeftShape")
    newShape("manualFan","manualFan1_3_1", {3, 1, 3, 2}, "up")
    newShape("manualFan","manualFan2_3_1", {3, 1, 4, 2}, "up")
    newShape("shape","triangle4_3_1", {3, 1, 1, 3}, "triangleBottomRightShape")
    newShape("shape","triangle5_3_1", {3, 1, 3, 3}, "triangleTopLeftShape", {1, 15})
    newTransition("triangle5_3_1", "flip-vertical")
    newShape("shape","bar1_3_1", {3, 1, 4, 3}, "bar", {"horz", 4})
    newShape("shape","triangle6_3_1", {3, 1, 6, 3}, "triangleBottomLeftShape")
    newShape("shape","triangle7_3_1", {3, 1, 1, 4}, "triangleTopRightShape")
    newShape("shape","triangle8_3_1", {3, 1, 4, 4}, "triangleBottomRightShape", {1, 14})
    newTransition("triangle8_3_1", "flip-vertical")
    newShape("shape","triangle9_3_1", {3, 1, 6, 4}, "triangleTopLeftShape")
    newShape("shape","triangle10_3_1", {3, 1, 3, 5}, "triangleTopRightShape")
    newShape("shape","triangle11_3_1", {3, 1, 4, 5}, "triangleTopLeftShape", {1, 11})

    --SCREEN 4-1
    newShape("door","door1_4_1", {4, 1, 1, 2}, "left")

    --SCREEN 1-2
    newShape("endPoint","endPoint1_1_2", {1, 2, 3, 3})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 1, 3}, { {"door-open","door1_1_1"} })
    newShape("switch","switch2_1_1", {1, 1, 3, 5}, { {"slide","triangle1_1_1"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
