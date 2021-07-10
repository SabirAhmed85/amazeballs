local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 1})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 7, 3})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,7,1},{2},{1,1,7,3}})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 2, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    })
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 5, 5}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"right"} } }
    })
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 5, 2}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 6, 2}, "down")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 4, 3}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 4}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,3,4},{2},{2,1,5,5}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 4}, "right")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 7, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 2, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan5_2_1", {2, 1, 4, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", 3, 1, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", 3, 1, 3, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", 3, 1, 7, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_2_2", 3, 1, 1, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_2_2", 3, 1, 4, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_2_2", 3, 1, 5, 2}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_2_2"},{"slide"},{},{3},{1},{3,1,4,4},{"*"},{3,1,4,3},{2},{3,1,5,3},{3},{3,1,5,2}})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", 3, 1, 6, 2}, "up")
    addToTransitionArray(ta,{{"autoFan2_2_2"},{"slide"},{},{1},{1},{3,1,6,2},{"*"},{3,1,6,3},{2},{3,1,7,3}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", 3, 1, 3, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan4_2_2", 3, 1, 7, 4}, "up")
    addToShapeArray(sp, "door","door2_2_2", 3, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle2_2_2", 3, 1, 1, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan5_2_2", 3, 1, 5, 5}, "left")
    addToTransitionArray(ta,{{"autoFan5_2_2"},{"slide"},{},{2},{1},{3,1,5,4},{2},{3,1,5,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 1, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {3, 1, 2, 3}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 5}, 12)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 3}, 14)
    addToShapeArray(sp, "item","small-present", {3, 1, 1, 4}, {})
    addToShapeArray(sp, "item","clock", {1, 1, 4, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
