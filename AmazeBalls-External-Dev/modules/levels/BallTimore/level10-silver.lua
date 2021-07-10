local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 1}, "down")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 4, 1}, {"none","right","none","left"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 6, 1}, "left")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 6, 2, "up","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 3}, "right")
    addToShapeArray(sp, "item","map", {1, 1, 4, 3})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 1, 4})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 3, 4}, "left")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 1, 5}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 5, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,5,5},{2},{1,1,5,4},{3},{1,1,6,4}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 5}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,5,2},{2},{2,1,6,1}})
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 7, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 2, 2}, "right")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_1", {2, 1, 4, 2, "TheShuttleMickyTake"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 3}, "right")
    addToShapeArray(sp, "gun","gun2_2_1", {2, 1, 5, 4}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,6,4},{2},{2,1,7,4}})
    --addToShapeArray(sp, "timeOut","timeOut1_2_1", {2, 1, 1, 5})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 5}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{1},{1},{2,1,2,2},{2},{2,1,2,5}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 5}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{},{1},{1},{2,1,4,4},{"*"},{2,1,4,5},{2},{2,1,5,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 3, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 2}, 140)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 2}, 145)
    addToShapeArray(sp, "item","small-present", {1, 1, 2, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 4, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
