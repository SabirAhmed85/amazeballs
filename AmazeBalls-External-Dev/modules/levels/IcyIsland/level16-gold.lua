local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 1, 1}, {"none","right","down","none"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 2}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,4,1},{2},{1,1,4,2}})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 5, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 7, 2}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 3}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 3, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 7, 4}, "bar", {"vert"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 4})
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 5, 4}, "left")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 4}, "triangleTopLeftShape", {1, 11})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 1, 5, "up","right","none","none"})
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 4, 5}, "right")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 5, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "manualFan","manualFan6_1_1", {1, 1, 7, 5}, "up")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 7, 1}, {"none","none","down","left"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 2}, "triangleTopLeftShape", {1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,2,2},{2},{2,1,4,2}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 5, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 5, 5}, "up")
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 7, 5, "up","none","none","left"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 6, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 3}, 90)
    addToShapeArray(sp, "item","coins", {2, 1, 1, 4}, 75)
    addToShapeArray(sp, "item","coins", {2, 1, 6, 4}, 20)
    addToShapeArray(sp, "item","small-present", {1, 1, 2, 1}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 1, 1}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
