local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,1,2},{2},{1,1,2,2},{3},{1,1,3,2}})
    addToShapeArray(sp, "item","map", {1, 1, 2, 4})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 3, 4}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "tunnel","tunnel1_1_1", {1, 1, 1, 5, 1, 2, 7, 5, "none"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 5}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,5,5},{2},{1,1,6,5}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 1, 6}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"switchSlide"},{},{1},{1},{1,1,1,6},{2},{1,1,2,6}})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 4, 1}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{3},{1},{1,2,2,1},{2},{1,2,3,1},{3},{1,2,4,1}})
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 3, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 3}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 5, 3}, "down")
    addToShapeArray(sp, "tunnel","tunnel2_1_2", {1, 2, 6, 3, 1, 2, 3, 5}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 3})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 1, 5}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{},{1},{1},{1,2,1,5},{2},{1,2,2,5}})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 4, 5}, "up")
    addToShapeArray(sp, "tunnel","tunnel3_1_2", {1, 2, 5, 5, 1, 2, 4, 3, "none"})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 2, 6}, "bar", {"vert", 2})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 2, 3}, { {"slide","bar2_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 4, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 4}, 185)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 2}, 70)
    addToShapeArray(sp, "item","small-present", {1, 1, 3, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 7, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
