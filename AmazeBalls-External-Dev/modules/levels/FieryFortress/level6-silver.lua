local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    -- 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"autoSlide"},{timePerSquare = 200, isActiveWhenSliding = false, pauseTime = 2500},{2},{1},{1,1,2,3},{2},{1,1,2,2},{3},{1,1,5,2}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape", {1, 2})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 2, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"autoSlide"},{timePerSquare = 200, isActiveWhenSliding = false, pauseTime = 2500},{2},{1},{1,1,2,5},{2},{1,1,2,4},{3},{1,1,5,4}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 2, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,3},{2},{1,1,3,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 6, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,5,5},{2},{1,1,6,5},{3},{1,1,7,4}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 6, 6}, "bar", {"vert", 3})

    --SCREEN 1-2
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{1},{1,2,1,1},{2},{1,2,1,3},{3},{1,2,3,1}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 7, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 1})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 7, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{3},{1},{1,2,5,2},{2},{1,2,6,2},{3},{1,2,7,2}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 5, 4}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 4}, "triangleTopRightShape", {1, 13})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 4, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{"lightDarkBlue"},{2},{1},{1,2,3,5},{2},{1,2,4,5},{3},{1,2,4,4},{4},{1,2,4,3}})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 5, 5}, "bar", {"vert"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 5, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 7, 4}, 150)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 4}, 75)
    addToShapeArray(sp, "item","coins", {1, 1, 1, 4}, 150)
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t