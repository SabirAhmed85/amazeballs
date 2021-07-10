local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 6, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"darkBlue"},{3},{1},{1,1,4,1},{2},{1,1,5,1},{3},{1,1,6,1}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 7, 5, "up","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{"darkBlue"},{2},{1},{1,1,7,4},{2},{1,1,7,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 1, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 5, 1}, "down")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 2, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 3, 2}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 6, 2}, "left")
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 3, 3}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 3}, "bar", {"horz"})
    addToShapeArray(sp, "manualFan","manualFan5_1_2", {1, 2, 5, 3}, "right")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 1, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan6_1_2", {1, 2, 3, 4}, "left")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 4, 4})
    addToShapeArray(sp, "manualFan","manualFan7_1_2", {1, 2, 2, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan8_1_2", {1, 2, 5, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 1, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 6, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 4}, 29)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 1}, 4)
    addToShapeArray(sp, "item","coins", {1, 2, 4, 3}, 20)
    addToShapeArray(sp, "item","big-present", {1, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
