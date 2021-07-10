local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 1})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0},{2},{1},{1,1,4,2},{2},{1,1,6,2}})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 3, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,1,3},{2},{1,1,3,3},{3},{1,1,5,3}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"autoSlide"},{timePerSquare = 340, pauseTime = 0},{2},{1},{1,1,2,4},{2},{1,1,3,4}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 6, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "backFire","backFire2_1_1", {1, 1, 6, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_1"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0, labelled = false},{2},{1},{1,1,2,4},{2},{1,1,6,4}})
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 1, 6}, "bar", {"vert"})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 2, 5})
    addToShapeArray(sp, "shape","bar6_1_1", {1, 1, 6, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 2}, "triangleTopRightShape", {1, 13})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 4, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{1},{1,2,4,2},{2},{1,2,5,2}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 4, 3}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 3}, "triangleLeftAndRightShape", {1})
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 7, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{"lightDarkBlue"},{2},{1},{1,2,7,2},{2},{1,2,7,4}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 1, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 2, 4}, 75)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 3}, 90)
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 4}, {})

    addToShapeArray(sp, "item","clock", {1, 2, 1, 3 })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
