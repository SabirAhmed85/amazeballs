local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 1, 1})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    addToShapeArray(sp, "tunnel","tunnel1_1_1", {1, 1, 7, 2, 1, 1, 2, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 3}, "down")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 4, 3}, "up")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 5, 3, "up","right","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,5,2},{2},{1,1,5,3}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 3}, "left")
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 3, 4, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{2},{1},{1,1,2,4},{2},{1,1,3,4}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1, "up", "disabled"})
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 2, 1}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,1,1},{2},{1,2,2,1}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 4, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 7, 1}, "left")
    addToShapeArray(sp, "spitter","spitter2_1_2", {1, 2, 3, 2, "up","right","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{2},{1},{1,2,2,2},{2},{1,2,3,2},{3},{1,2,4,2}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 2, 3}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{},{2},{1},{1,2,2,2},{2},{1,2,2,3}})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 3, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "spitter","spitter3_1_2", {1, 2, 4, 3}, {"none","right","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,2,3,3},{2},{1,2,4,3}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 3}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{},{2},{1},{1,2,5,1},{2},{1,2,6,3},{3},{1,2,7,4}})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 4, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "spitter","spitter4_1_2", {1, 2, 4, 4, "up","none","down","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_2"},{"slide"},{},{2},{1},{1,2,1,4},{2},{1,2,4,4},{3},{1,2,5,4}})
    addToShapeArray(sp, "spitter","spitter5_1_2", {1, 2, 3, 5, "up","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter5_1_2"},{"slide"},{},{1},{1},{1,2,3,5},{2},{1,2,4,5}})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 5, "down", "disabled"})

    --SCREEN 1-3
    addToShapeArray(sp, "item","compass", {1, 3, 5, 1})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 6, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "spitter","spitter1_1_3", {1, 3, 4, 2}, {"none","none","down","left"})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 2, 3}, "triangleBottomRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "tunnel","tunnel1_1_3", {1, 3, 7, 3, 1, 2, 1, 3}, "right")
    addToShapeArray(sp, "item","map", {1, 3, 4, 4})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 7, 2}, { {"door-open","door2_1_2"} }, "two-way", "not-labelled")
    addToShapeArray(sp, "switch","switch1_1_3", {1, 3, 6, 3}, { {"door-open","door1_1_2"} }, "two-way", "not-labelled")
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 3, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 6, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 3, 1, 2}, 50)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 1}, 110)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 3}, 80)
    addToShapeArray(sp, "item","small-present", {1, 3, 2, 4}, {})

    addToShapeArray(sp, "item","small-present", {1, 1, 2, 1}, {})

    addToShapeArray(sp, "item","small-present", {1, 1, 6, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
