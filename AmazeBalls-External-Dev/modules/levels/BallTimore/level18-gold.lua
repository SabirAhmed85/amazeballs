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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleTopLeftShape", {1, 5})
    newShape("shape","bar1_1_1", {1, 1, 3, 2}, "bar", {"vert"})
    newShape("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    newShape("shape","bar2_1_1", {1, 1, 6, 2}, "bar", {"horz", 2})
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 3}, "down")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,2,3},{1,1,4,2},{1,1,5,2},{1,1,5,3,"*"},{1,1,7,3}})
    newShape("autoFan","autoFan1_1_1", {1, 1, 1, 4}, "right")
    newTransition("autoFan1_1_1", "switchSlide", {}, {{1,1,1,3},{1,1,1,4}})
    newShape("shape","triangle4_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    newShape("shape","triangle5_1_1", {1, 1, 3, 4}, "triangleTopLeftShape")
    newShape("shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2})
    newTransition("bar3_1_1", "switchSlide", {}, {{1,1,8,3},{1,1,8,4}})
    newShape("shape","triangle6_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    newShape("shape","triangle7_1_1", {1, 1, 5, 5}, "triangleTopLeftShape")
    newTransition("triangle7_1_1", "switchSlide", {}, {{1,1,5,5},{1,1,6,5}})
    newShape("door","door1_1_1", {1, 1, 7, 5, "down", "disabled"})

    --SCREEN 1-2
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("shape","bar1_1_2", {1, 2, 1, 2}, "bar", {"horz", 4})
    newTransition("bar1_1_2", "slide", {}, {{1,2,1,2},{1,2,1,3}})
    newShape("shape","triangle1_1_2", {1, 2, 3, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_2", {1, 2, 5, 2}, "triangleTopRightShape")
    newTransition("triangle2_1_2", "flip-vertical")
    newShape("shape","triangle3_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("gem","redCoin", {1, 2, 4, 4}, "redCoin")
    newShape("shape","triangle4_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, 5, "breakable"})
    newShape("door","door1_1_2", {1, 2, 5, 5}, "down")
    newShape("shape","bar2_1_2", {1, 2, 6, 5}, "bar", {"vert"})
    newShape("shape","bar3_1_2", {1, 2, 7, 5}, "bar", {"vert"})
    newShape("shape","bar4_1_2", {1, 2, 6, 6}, "bar", {"vert"})
    newShape("shape","bar5_1_2", {1, 2, 7, 6}, "bar", {"vert"})

    --SCREEN 1-3
    newShape("autoFan","autoFan1_1_3", {1, 3, 3, 1}, "right")
    newShape("shape","triangle1_1_3", {1, 3, 6, 1}, "triangleTopLeftShape", {1, 1})
    newShape("shape","triangle2_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape")
    newTransition("triangle2_1_3", "slide", {}, {{1,3,7,1},{1,3,7,2}})
    --newShape("timeOut","timeOut1_1_3", {1, 3, 5, 2, 4})
    newShape("manualFan","manualFan1_1_3", {1, 3, 6, 2}, "right")
    newShape("autoFan","autoFan1_1_3", {1, 3, 7, 3}, "right")
    newShape("door","door1_1_3", {1, 3, 7, 3}, "right")
    newShape("shape","triangle3_1_3", {1, 3, 1, 4}, "triangleTopLeftShape", {1, 13})
    newTransition("triangle3_1_3", "flip-horizontal")
    newShape("autoFan","autoFan1_1_3", {1, 3, 5, 4}, "left")
    newShape("manualFan","manualFan1_1_3", {1, 3, 6, 4}, "right")
    newShape("shape","triangle4_1_3", {1, 3, 3, 5}, "triangleBottomRightShape", {1, 1})
    newTransition("triangle4_1_3", "flip-vertical")
    newShape("shape","triangle5_1_3", {1, 3, 7, 5}, "triangleTopLeftShape")
    newTransition("triangle5_1_3", "slide", {}, {{1,3,7,4},{1,3,7,5}})

    --SCREEN 2-3
    newShape("shape","triangle1_2_3", {2, 3, 3, 1}, "triangleBottomRightShape")
    newShape("autoFan","autoFan1_2_3", {2, 3, 5, 1}, "down")
    newShape("shape","triangle1_2_3", {2, 3, 4, 2}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape","triangle1_2_3", {2, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","triangle1_2_3", {2, 3, 3, 3}, "triangleTopLeftShape")
    newShape("autoFan","autoFan1_2_3", {2, 3, 5, 3}, "right")
    newShape("endPoint","endPoint1_2_3", {2, 3, 4, 4})
    newShape("shape","triangle1_2_3", {2, 3, 7, 4}, "triangleBottomLeftShape", {1, 22, "breakable"})
    newShape("shape","triangle1_2_3", {2, 3, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_2_3", {2, 3, 2, 5}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("shape","bar1_2_3", {2, 3, 3, 5}, "bar", {"horz", 4})
    newTransition("bar1_2_3", "slide", {}, {{2,3,3,3},{2,3,3,5}})
    newShape("shape","triangle1_2_3", {2, 3, 6, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("shape","triangle1_2_3", {2, 3, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 2, 1}, { {"slide","bar3_1_1"},{"slide","autoFan1_1_1"} })
    newShape("switch","switch2_1_1", {1, 1, 5, 4}, { {"slide","triangle7_1_1"},{"door-open","door1_1_1"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
