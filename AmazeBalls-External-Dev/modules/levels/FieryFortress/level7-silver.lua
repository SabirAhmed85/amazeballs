local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 1}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 5, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, 8})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,1,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, 11})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,5,2},{2},{1,1,7,2}})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 1, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 7, 3}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 4})
    addToShapeArray(sp, "autoFan","autoFan5_1_1", {1, 1, 4, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_1_1"},{"slide"},{"orange"},{2},{1},{1,1,3,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,5,4},{2},{1,1,6,4}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 5}, "up")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 5})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, 11})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 1, "up", "disabled"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 3, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 4, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 5, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 6, 2}, "bar", {"vert"})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 2}, "down")
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 4, 2}, { {"door-open", "door2_1_2"} } })
    addToShapeArray(sp, "shape","bar6_1_2", {1, 2, 4, 3}, "bar", {"vert"})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 6, 2}, "left")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_2", {1, 2, 1, 3})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 2, 3}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 3}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 4, 4}, "down")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan5_1_2", {1, 2, 2, 5}, "right")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 5})
    addToShapeArray(sp, "autoFan","autoFan5_1_2", {1, 2, 7, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 5, 3}, 250)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 4}, 75)
    addToShapeArray(sp, "item","coins", {1, 2, 6, 1}, 75)
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 1, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t