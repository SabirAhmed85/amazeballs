local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 1, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 1}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 1}, "right")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 6, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 1})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","map", {1, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 6, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 3})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 6, 5}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle9_1_1"},{"slide"},{"orange"},{2},{1},{1,1,5,5},{2},{1,1,6,5}})
    addToShapeArray(sp, "backFire","backFire2_1_1", {1, 1, 7, 5})

    -- 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 1})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "simple","simple2_1_2", {1, 2, 2, 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 4, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0, labelled = false},{2},{1},{1,2,4,1},{2},{1,2,4,2}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 2}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0},{2},{1},{1,2,6,1},{2},{1,2,6,2},{3},{1,2,6,3}})
    addToShapeArray(sp, "simple","simple3_1_2", {1, 2, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple3_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,6,1},{2},{1,2,6,2}})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 3, 3}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0, labelled = false},{2},{1},{1,2,2,3},{2},{1,2,3,3}})
    addToShapeArray(sp, "simple","simple4_1_2", {1, 2, 5, 3})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 4, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 2, 1}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 5, 3}, 75)
    addToShapeArray(sp, "item","big-present", {1, 1, 6, 3}, {})

    addToShapeArray(sp, "item", "small-present", {1, 2, 2, 4}, {})

    addToShapeArray(sp, "item","coins", {1, 1, 1, 3, 210}) 

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
