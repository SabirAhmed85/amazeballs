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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, 9})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,2,2},{1,1,2,3}})
    newShape("shape", "bar1_1_1", {1, 1, 4, 2}, "bar", {"vert"})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 4, 2})
    newShape("shape", "bar2_1_1", {1, 1, 4, 3}, "bar", {"vert"})
    newShape("shape", "triangle3_1_1", {1, 1, 6, 3}, "triangleTopRightShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,6,3},{1,1,7,2}})
    newShape("shape", "triangle4_1_1", {1, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_1", {1, 1, 6, 4}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 3, 5}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("autoFan", "autoFan1_1_2", {1, 2, 2, 1}, "left")
    newShape("door", "door1_1_2", {1, 2, 4, 1}, "up")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 6, 1}, "down")
    newShape("shape", "triangle1_1_2", {1, 2, 7, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape", "bar1_1_2", {1, 2, 2, 2}, "bar", {"horz", 3})
    newShape("shape", "triangle2_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 4, 2}, "up")
    newShape("shape", "triangle3_1_2", {1, 2, 6, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_2", {1, 2, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle6_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan3_1_2", {1, 2, 5, 3}, "left")
    newShape("shape", "triangle7_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _})
    newShape("shape", "triangle8_1_2", {1, 2, 3, 4}, "triangleBottomRightShape")
    newShape("shape", "triangle9_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan4_1_2", {1, 2, 5, 5}, "up")
    newTransition("autoFan4_1_2", "slide", {}, {{1,2,1,5},{1,2,3,5},{1,2,5,5}})
    --newShape("timeOut", "timeOut1_1_1", {1, 1, 6, 5, 3})

    --SCREEN 2-2
    newShape("shape", "bar1_2_2", {2, 2, 1, 1}, "bar", {"horz", 3})
    newShape("gem", "redCoin", {2, 2, 1, 1}, "redCoin")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 4, 1}, "left")
    newShape("shape", "bar2_2_2", {2, 2, 5, 1}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan2_2_2", {2, 2, 5, 1}, "right")
    newShape("gem", "purple", {2, 2, 6, 1}, "purple")
    newShape("manualFan", "manualFan3_2_2", {2, 2, 7, 1}, "down")
    newShape("shape", "bar3_2_2", {2, 2, 8, 1}, "bar", {"horz", 2})
    newShape("shape", "triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 2, 2}, "left")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 4, 2}, "up")
    newShape("manualFan", "manualFan4_2_2", {2, 2, 5, 2}, "up")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 2}, "left")
    --newShape("item", "coins", {2, 2, 7, 2}, 250)
    newShape("manualFan", "manualFan5_2_2", {2, 2, 2, 3}, "right")
    newShape("shape", "triangle2_2_2", {2, 2, 3, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 5, 3}, "down")
    newShape("shape", "bar4_2_2", {2, 2, 7, 3}, "bar", {"horz", 3})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 7, 3}, "right")
    newShape("shape", "triangle3_2_2", {2, 2, 1, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 2, 4}, "up")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 4, 4}, "left")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 4}, "down")
    newShape("door", "door1_2_2", {2, 2, 1, 5}, "left")
    newShape("shape", "triangle4_2_2", {2, 2, 1, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("manualFan", "manualFan6_2_2", {2, 2, 5, 5}, "left")

    --SCREEN 3-2
    newShape("shape", "triangle1_3_2", {3, 2, 6, 1}, "triangleBottomLeftShape")
    newShape("door", "door1_3_2", {3, 2, 1, 4}, "left")
    newShape("characterChangePoint", "characterChangePoint1_3_2", {3, 2, 2, 4})
    newShape("item", "map", {3, 2, 4, 4})
    newShape("shape", "triangle2_3_2", {3, 2, 6, 5}, "triangleTopRightShape")
    newTransition("triangle2_3_2", "switchSlide", {labelled=false}, {{3,2,6,4},{3,2,6,5}})

    --SWITCHES
    newShape("switch", "switch1_3_2", {3, 2, 5, 4}, { {"slide", "triangle2_3_2"} }, {"one-way", "not-labelled"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 3
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
