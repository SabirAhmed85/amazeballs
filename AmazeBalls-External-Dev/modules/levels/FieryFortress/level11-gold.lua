local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 1}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"orange"},{2},{1},{1,1,6,1},{2},{1,1,7,1}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 3, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{2},{1},{1,1,3,1},{2},{1,1,3,2}})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 4, 2}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{"orange"},{1},{1},{1,1,4,2},{2},{1,1,5,2}})
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 1, 3}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"slide"},{"orange"},{2},{1},{1,1,1,1},{2},{1,1,1,3}})
    addToShapeArray(sp, "autoFan","autoFan5_1_1", {1, 1, 3, 3}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_1_1"},{"slide"},{"orange"},{2},{1},{1,1,2,4},{"*"},{1,1,2,3},{2},{1,1,3,3}})
    addToShapeArray(sp, "autoFan","autoFan6_1_1", {1, 1, 4, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan6_1_1"},{"slide"},{"orange"},{1},{1},{1,1,4,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan7_1_1", {1, 1, 2, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan7_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,5},{2},{1,1,3,4}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan8_1_1", {1, 1, 6, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan8_1_1"},{"slide"},{"orange"},{2},{1},{1,1,6,3},{2},{1,1,6,5}})

    -- 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,1},{2},{1,2,4,2}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 1}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,5,1},{2},{1,2,5,2}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 1}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 6, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 7, 2}, "triangleTopLeftShape")
    --addToShapeArray(sp, "timeOut","timeOut1_1_2", {1, 2, 1, 3, 3})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 2, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 3, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 3, 4}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{"brown"},{1},{1},{1,2,3,4},{2},{1,2,6,4}})
    addToShapeArray(sp, "shape","triangle10_1_2", {1, 2, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 6, 4}, "up")
    addToShapeArray(sp, "shape","triangle11_1_2", {1, 2, 7, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle12_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle13_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle14_1_2", {1, 2, 4, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 5, 6}, "bar", {"vert", 4})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 1, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 7, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","big-present", {1, 2, 6, 5}, {})

    --addToShapeArray(sp, "item","coins", {1, 1, 5, 2}, 90)
    --addToShapeArray(sp, "item","coins", {1, 2, 1, 3}, 90)
    --addToShapeArray(sp, "item","coins", {1, 2, 5, 5, 35)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
