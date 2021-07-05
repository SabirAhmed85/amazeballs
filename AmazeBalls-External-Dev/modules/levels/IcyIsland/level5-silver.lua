local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"switchSlide"},{},{1},{1},{1,1,5,2},{2},{1,1,5,3}})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 7, 3}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{3},{1},{1,1,7,1},{2},{1,1,7,2},{3},{1,1,7,3}})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 2, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{3},{1},{1,1,1,2},{2},{1,1,2,3},{3},{1,1,2,4}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 3, 4}, "right")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 4}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"switchSlide"},{},{2},{1},{1,1,3,4},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape", {1, 3, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 6, 4}, "down")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 3, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"slide"},{},{1},{1},{1,1,3,5},{2},{1,1,4,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape", {1, 4, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "item","big-present", {1, 2, 7, 3}, {})

    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 4})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 3, 3}, { {"slide","bar1_1_1"},{"slide","bar2_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 3, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 2, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 4, 235})
    addToShapeArray(sp, "item","coins", {1, 2, 4, 1}, 170)
    addToShapeArray(sp, "item","big-present", {1, 1, 6, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 1}, {})
    addToShapeArray(sp, "item","hook", {2, 1, 6, 3}, {})
    addToShapeArray(sp, "item","dummyBall", {1, 2, 2, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
