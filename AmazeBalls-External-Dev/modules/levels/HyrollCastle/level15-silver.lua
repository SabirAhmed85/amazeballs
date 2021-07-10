local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left")
    addToShapeArray(sp, "item","mystery-block", {1, 1, 2, 2}, {
        {name = "simple"},
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"up", "down", "left"} } }
    })
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 5, 2}, "up")
    addToShapeArray(sp, "item","map", {1, 1, 6, 2})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 2, 3}, {
        {name = "triangle", properties = {shape = "triangleBottomLeftShape"} },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"down", "left"} } }
    })
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 4, 4}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 4, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 1}, "right")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 3, 1})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 4, 1})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 1, 2}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{"orange"},{2},{1},{2,1,1,2},{2},{2,1,3,2}})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 1, 2}, "right")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 1, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 1, 4}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,1,4},{2},{2,1,4,5}})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 6, 4}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_1"},{"slide"},{"orange"},{2},{1},{2,1,1,3},{2},{2,1,6,4}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 4, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 6, 5}, "left")
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 4, 6}, "bar", {"vert"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 2, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 3, 5}, 90)
    addToShapeArray(sp, "item","small-present", {1, 1, 6, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
