local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 1, "icy"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"horz"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 3})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,1,4},{2},{1,1,3,4},{3},{1,1,4,4},{4},{1,1,7,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 3, 6}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 4, 6}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 7, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1, "up", "disabled"})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 3, 2}, "down")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 4}, "right")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 4, 1}, { {"door-open","door1_1_2"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 1, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 1}, 90)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 1}, 70)
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 4}, {})

    addToShapeArray(sp, "item","hook", {1, 2, 6, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
