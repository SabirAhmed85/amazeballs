local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{2},{1},{1,1,1,1},{2},{1,1,1,2}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 2}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{2},{1},{1,1,3,1},{2},{1,1,3,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomRightShape", {1, 9})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,3,3},{2},{1,1,3,4}})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 4, 3, "up","none","none","left"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 3}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,6,1},{2},{1,1,6,3},{3},{1,1,7,4}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 4, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 5, 5}, "down")

    --SCREEN 1-3
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 2, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 4, 1}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_3"},{"slide"},{},{1},{1},{1,3,4,1},{2},{1,3,4,5}})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 6, 1}, "triangleTopRightShape", {1, 16, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "spitter","spitter1_1_3", {1, 3, 6, 2, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_3"},{"slide"},{},{2},{1},{1,3,5,2},{2},{1,3,6,2}})
    addToShapeArray(sp, "spitter","spitter2_1_3", {1, 3, 2, 3, "up","none","down","none"})
    addToShapeArray(sp, "spitter","spitter3_1_3", {1, 3, 6, 4}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_3"},{"slide"},{},{2},{1},{1,3,5,4},{2},{1,3,6,4}})
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 2, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 5, 5}, "up")
    addToShapeArray(sp, "shape","bar2_1_3", {1, 3, 6, 5}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_3"},{"slide"},{},{1},{1},{1,3,6,5},{2},{1,3,7,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 7, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 3, 6, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 4, 375})
    addToShapeArray(sp, "item","coins", {1, 2, 2, 5}, 130)
    addToShapeArray(sp, "item","coins", {1, 3, 4, 5}, 85)
    addToShapeArray(sp, "item","small-present", {1, 1, 2, 2}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 2, 2}, {})

    addToShapeArray(sp, "item","big-present", {1, 3, 1, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
