local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 7, 1}, {"none", "none", "down", "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,2,1},{2},{1,1,7,1}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 2}, "left")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 5, 2}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{},{2},{1},{1,1,3,2},{2},{1,1,5,2}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 1, 3}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"switchSlide"},{},{1},{1},{1,1,1,3},{2},{1,1,3,3}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 3}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "item","map", {1, 1, 2, 4})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 4}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,6,4},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 6, 5}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,5},{2},{1,1,6,5}})
    addToShapeArray(sp, "shape","bar6_1_1", {1, 1, 6, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 5})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 2, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,3,3},{3},{1,2,5,3},{4},{1,2,7,3}})
    --addToShapeArray(sp, "item","coins", {1, 2, 5, 5}, 50)
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 6}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 5, 6}, "bar", {"vert"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 5, 4}, { {"slide","bar4_1_1"},{"slide","bar5_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 3, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 7, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 2}, 55)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 5}, 160)
    addToShapeArray(sp, "item","small-present", {1, 1, 6, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
