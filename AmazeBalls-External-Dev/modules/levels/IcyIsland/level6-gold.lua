local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 1}, "right")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 5, 2}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{3},{1},{1,1,1,2},{2},{1,1,2,2},{2},{1,1,5,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, 1)
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 6, 3, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{1},{1},{1,1,6,3},{2},{1,1,6,5}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "spitter","spitter3_1_1", {1, 1, 2, 4}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,2,4}})
    addToShapeArray(sp, "spitter","spitter4_1_1", {1, 1, 3, 4, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_2"},{"slide"},{},{1},{1},{1,1,3,4},{2},{1,1,3,5}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 4}, "right")
    addToShapeArray(sp, "spitter","spitter5_1_1", {1, 1, 7, 4}, {"none","none","down","none"})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleTopLeftShape", {1, 5, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 4, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 1}, "down")
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 7, 1}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,7,1},{2},{2,1,7,3},{3},{2,1,7,5}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 2, 2}, "right")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 2}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, 3, "icy"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 1, 3}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,1,3},{3},{2,1,1,5}})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 4, 3}, "triangleBottomRightShape", {1, 9, "icy"})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 3, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 5, 4}, "up")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 2, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 4, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 4, 5})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 5, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 6, 5}, "right")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 4, 6}, "bar", {"vert", 3})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 3, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 2}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 6, 1, 465})
    addToShapeArray(sp, "item","big-present", {2, 1, 3, 3}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 1}, {})
    addToShapeArray(sp, "item","dummyBall", {2, 1, 4, 4}, {})
    addToShapeArray(sp, "item","hook", {1, 1, 3, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
