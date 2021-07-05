local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,5,1},{2},{1,1,6,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{2},{1},{1,1,1,1},{2},{1,1,1,2}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{2},{1},{1,1,1,3},{2},{1,1,1,4}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{3},{1},{1,1,2,2},{2},{1,1,3,2},{3},{1,1,2,4}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 3, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 5, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,3,5},{2},{1,1,5,5}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{},{3},{1},{1,1,4,3},{2},{1,1,7,3},{3},{1,1,7,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 7, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,7,1},{2},{1,2,7,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 3, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{3},{1},{1,2,2,3},{2},{1,2,3,3},{3},{1,2,3,2}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{2},{1},{1,2,1,1},{2},{1,2,1,4}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 6, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{},{2},{1},{1,2,5,3},{2},{1,2,6,3},{3},{1,2,6,4},{4},{1,2,7,4}})
    addToShapeArray(sp, "backFire","backFire3_1_2", {1, 2, 4, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire3_1_2"},{"slide"},{},{2},{1},{1,2,4,4},{2},{1,2,4,5}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 6, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{1},{1},{1,2,6,5},{2},{1,2,7,5}})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 7, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 5}, "right")


    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 1}, "triangleBottomRightShape", {1, 9})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 7, 1}, "left")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 2, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 7, 2}, "down")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 3, 3}, "triangleBottomRightShape", {1, 9})
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 5, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 7, 4}, "up")
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 1, 5})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"slide"},{},{1},{1},{2,2,2,5},{2},{2,2,3,5},{3},{2,2,4,5},{4},{2,2,5,5}})
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 7, 5})

    --GEMS  
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 3, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 5, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 2, 5, 1}, 225)
    addToShapeArray(sp, "item","coins", {2, 2, 2, 3}, 145)
    addToShapeArray(sp, "item","coins", {1, 2, 4, 1}, 130)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 1}, 80)
    addToShapeArray(sp, "item","clock", {1, 2, 4, 2, "clock1_1_1", 10, 1})
    addToShapeArray(sp, "item","big-present", {2, 2, 6, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 2}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 3, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
