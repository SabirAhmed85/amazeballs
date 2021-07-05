local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_2_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 4, 5, "up","right","down","left"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 5, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 7, 1}, "left")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 5, 2}, "left")
    addToShapeArray(sp, "tunnel","tunnel1_2_1", {2, 1, 1, 3, 2, 1, 7, 5, "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,1,3}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 6, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 3, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan5_2_1", {2, 1, 7, 4}, "up")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 8, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 5}, "triangleTopRightShape", {1, 13})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 6, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 1, 1})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 4, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 5, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 2, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 6, 2}, "right")
    addToShapeArray(sp, "tunnel","tunnel1_2_2", {2, 2, 3, 3, 2, 2, 1, 5, "none"})
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 5, 3}, "right")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 4}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"slide"},{},{2},{1},{2,2,2,5},{"*"},{2,2,2,4},{2},{2,2,4,4}})
    addToShapeArray(sp, "manualFan","manualFan5_2_2", {2, 2, 6, 4}, "left")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 2, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan6_2_2", {2, 2, 3, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 7, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{2},{1},{2,2,6,5},{2},{2,2,7,5}})

    --GEMS  
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 7, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 3}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 2, 215})
    addToShapeArray(sp, "item","coins", {2, 1, 6, 5}, 75)
    addToShapeArray(sp, "item","coins", {2, 2, 6, 3}, 180)
    addToShapeArray(sp, "item","coins", {2, 2, 4, 5}, 105})
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 2}, {})
    addToShapeArray(sp, "item","clock", {2, 2, 4, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
