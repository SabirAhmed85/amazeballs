local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 1}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 2})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 3, 5}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 6, 1}, "left")
    addToShapeArray(sp, "item","map", {2, 1, 2, 2})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,6,2},{2},{2,1,7,2}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 1, 3}, "down")
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 4, 3}, "left")
    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 7, 3})
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan5_2_1", {2, 1, 1, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan6_2_1", {2, 1, 3, 4}, "left")
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 1, 5}, {"none","right","none","none"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"autoSlide"},{timePerSlide=600},{1},{1},{2,1,2,5},{2},{2,1,6,5}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 7, 5}, "left")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
