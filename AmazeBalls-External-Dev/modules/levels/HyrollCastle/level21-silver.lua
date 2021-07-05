local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 1})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 1, 3})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 4}, "left")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 2, 5})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 1})
    addToShapeArray(sp, "item","mystery-block", {1, 2, 1, 2}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"up", "left"} } }
    })
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 5, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 3}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,1,5},{2},{1,2,2,3}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 3, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 4, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_2"},{"slide"},{},{2},{1},{1,2,3,5},{2},{1,2,4,4},{3},{1,2,6,4}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 5, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 4, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 4}, 470)
    addToShapeArray(sp, "item","coins", {1, 1, 5, 4}, 70)
    addToShapeArray(sp, "item","coins", {1, 2, 6, 5}, 80)
    addToShapeArray(sp, "item","fireCape", {1, 2, 7, 2, 3, 5})
    addToShapeArray(sp, "item","big-present", {1, 2, 3, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 3, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
