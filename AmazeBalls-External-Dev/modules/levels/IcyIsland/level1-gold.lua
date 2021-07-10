local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "item","map", {1, 1, 5, 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 4}, "triangleTopLeftShape", {1, 11})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 5, 4}, {"none","right","down","left"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,2,1},{2},{1,2,2,2}})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,4,1},{2},{1,2,5,1},{3},{1,2,5,2}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 1}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,6,1},{2},{1,2,7,1}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 1, 2})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{},{1},{1},{1,2,6,2},{2},{1,2,6,3},{3},{1,2,7,5}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"horz"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 3, 3}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 5, 3}, "down")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{},{2},{1},{1,2,1,5},{2},{1,2,1,4},{3},{1,2,3,4}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 5}, "down")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 5}, "down")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 5, 5}, "down")

    --SCREEN 1-3
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 1, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "door","door3_1_3", {1, 3, 3, 1}, "up")
    addToShapeArray(sp, "door","door3_1_3", {1, 3, 4, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 4, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_3"},{"slide"},{},{2},{1},{1,3,4,3},{2},{1,3,4,2},{3},{1,3,5,2},{4},{1,3,5,1}})
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 6, 1}, "down")
    addToShapeArray(sp, "door","door3_1_3", {1, 3, 7, 1}, "up")
    addToShapeArray(sp, "shape","bar2_1_3", {1, 3, 1, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 1, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 2, 2}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_3"},{"slide"},{},{1},{1},{1,3,2,2},{2},{1,3,3,2}})
    addToShapeArray(sp, "shape","bar3_1_3", {1, 3, 3, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan2_1_3", {1, 3, 3, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_1_3", {1, 3, 5, 3}, "left")
    addToShapeArray(sp, "shape","bar4_1_3", {1, 3, 6, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar5_1_3", {1, 3, 3, 4}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar6_1_3", {1, 3, 5, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan3_1_3", {1, 3, 2, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_3"},{"slide"},{},{2},{1},{1,3,1,5},{2},{1,3,2,5}})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 7, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 3, 4, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 4}, 110)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 3}, 80)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 5}, 60)
    addToShapeArray(sp, "item","big-present", {1, 2, 7, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 4, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
