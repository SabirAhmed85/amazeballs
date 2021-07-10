local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 2, 5}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"flip-horizontal"}})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 2, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 6, 4}, "up")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 5}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"flip-vertical"}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 5}, "down")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 5}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"flip-horizontal"}})

    --SCREEN 1-3
    addToShapeArray(sp, "item","mystery-block", {1, 3, 3, 2}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"right","down"} } },
        {name = "spitter", properties = {directions = {"right","down","left"} } }
    })
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 5, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "item","mystery-block", {1, 3, 7, 2}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "triangle", properties = {shape = {"triangleBottomRightShape"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"left","down"} } }
    })
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 4, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "simple","simple1_1_3", {1, 3, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_3"},{"slide"},{},{1},{1},{1,3,4,4},{2},{1,3,6,4},{3},{1,3,7,4}})
    addToShapeArray(sp, "simple","simple2_1_3", {1, 3, 3, 5})
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 5, 5})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 6, 5}, "triangleTopRightShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 3, 7, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 1, 5}, 135)
    addToShapeArray(sp, "item","coins", {1, 3, 6, 1}, 26)
    addToShapeArray(sp, "item","big-present", {1, 3, 6, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 2, 1}, {})
    addToShapeArray(sp, "item","small-present", {1, 3, 5, 1}, {})
    addToShapeArray(sp, "item","dummyBall", {1, 1, 7, 2}, {})
    addToShapeArray(sp, "item","hook", {1, 3, 1, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
