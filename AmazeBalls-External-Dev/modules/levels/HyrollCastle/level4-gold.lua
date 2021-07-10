local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 1, 1})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 2}, "up")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "backFire","backFire2_1_1", {1, 1, 7, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_1"},{"slide"},{},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,4,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "door","door4_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "door","door4_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "door","door5_1_2", {1, 2, 6, 1, "up", "disabled"})
    addToShapeArray(sp, "door","door6_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 3}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,4,3},{2},{1,2,5,3}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 3, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 2, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 5}, "up")
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, 13})
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 4, 5}, { {"door-open", "door5_1_2"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 6, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 7, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 3}, 75)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 2}, 60)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 3, 45})
    addToShapeArray(sp, "item","coins", {1, 1, 5, 5, 175})
    addToShapeArray(sp, "item","small-present", {1, 2, 7, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
