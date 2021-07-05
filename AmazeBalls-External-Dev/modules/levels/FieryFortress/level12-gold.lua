local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1, "triangleTopAndBottomShape", 2, 19})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,1},{2},{1,1,3,1}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 6, 1}, "left")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 3}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"switchSlide"},{timePerSquare = 400},{1},{1},{1,1,4,3},{2},{1,1,5,3}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 3, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 6, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 2, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,4,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 5}, "left")

    -- 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 1}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{1,2,5,1},{2},{1,2,6,1}})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 7, 1})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 6, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","compass", {1, 2, 5, 3})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 6, 3}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 2, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","map", {1, 2, 3, 4})
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 4, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 1, 5})
    addToShapeArray(sp, "shape","triangle10_1_2", {1, 2, 2, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 6, 4}, "bar", {"horz"})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 6, 4})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 7, 4}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan5_1_2", {1, 2, 3, 5}, "right")
    addToShapeArray(sp, "shape","triangle11_1_2", {1, 2, 2, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 6, 5}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle12_1_2", {1, 2, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --ALL SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 7, 2}, { {"slide","bar2_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 6, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","small-present", {1, 1, 3, 2}, {})

    --addToShapeArray(sp, "item","coins", {1, 1, 2, 2}, 20)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
