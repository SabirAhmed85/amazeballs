local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    local sp = shapeArrayParameters;
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,4,2},{2},{1,1,5,2}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 3, 2}, {
        {name = "triangle", properties = {directions = {"triangleBottomRightShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleTopLeftShape", {1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-vertical"}})
    --addToShapeArray(sp, "gem","blueCoin", {1, 1, 7, 4}, "blueCoin")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{2},{1},{1,1,3,4},{2},{1,1,3,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 6, 5}, "down")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,2,2},{2},{1,2,3,3},{3},{1,2,3,4}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 5, 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 3})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 2, 4}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 1, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 4, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 5, 5}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 6, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 2, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 1}, 225)
    addToShapeArray(sp, "item","coins", {1, 1, 2, 3}, 85)
    addToShapeArray(sp, "item","coins", {1, 2, 1, 4}, 60)
    addToShapeArray(sp, "item","coins", {1, 2, 5, 5}, 3)
    addToShapeArray(sp, "item","clock", {1, 1, 5, 1, "clock1_1_1", 10, 1})
    addToShapeArray(sp, "item","big-present", {1, 1, 7, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 6, 3}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
