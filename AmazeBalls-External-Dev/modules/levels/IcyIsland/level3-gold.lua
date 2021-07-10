local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 1}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 1, 2}, "down")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 6, 2}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3}})
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 4, 3, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,4,3}})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 3, 4}, "down")
    addToShapeArray(sp, "spitter","spitter3_1_1", {1, 1, 6, 4}, {"none", "none", "down"}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_1"},{"slide"},{},{1},{1},{1,1,6,4},{2},{1,1,7,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 2, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 7, 5}, "left")

    --SCREEN 2-1
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 2, 1}, {"none","right","down","none"})
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 4, 1, "up","right","down","left"})
    addToShapeArray(sp, "spitter","spitter3_2_1", {2, 1, 6, 1}, {"none","none","down","left"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleTopLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 2}, "down")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 4, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "spitter","spitter4_2_1", {2, 1, 7, 2}, {"none","right","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_2_1"},{"slide"},{},{1},{1},{2,1,7,2},{2},{2,1,7,3}})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 1, 3}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,3,3},{2},{2,1,3,4}})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 4, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 7, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 1, 5})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 5}, "left")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 5, 5}, "bar", {"horz"})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 6, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 7, 5}, "down")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 8, 5}, "bar", {"horz", 2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 5, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 1}, 140)
    addToShapeArray(sp, "item","coins", {1, 1, 5, 4}, 75)
    addToShapeArray(sp, "item","coins", {2, 1, 6, 4, 125})
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
