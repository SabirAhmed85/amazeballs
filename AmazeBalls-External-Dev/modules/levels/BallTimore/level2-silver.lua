local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 1, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 1}, "up")
    addToShapeArray(sp, "gun","gun2_1_1", {1, 1, 3, 2}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 3})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 3, 4, "up","right","down","left"})
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gun","gun3_1_1", {1, 1, 5, 4}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 5}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,6,5},{2},{1,1,7,3}})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleTopRightShape", {1, 2, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,1,1},{2},{1,2,1,2}})
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 4, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 2}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,7,2},{2},{1,2,7,3}})
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 3, 3}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,2,2},{2},{1,2,3,3}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 5, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{1},{1},{1,2,5,3},{2},{1,2,5,4}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 4}, "triangleTopAndBottomShape", {1})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 3}, 85)
    addToShapeArray(sp, "item","coins", {1, 2, 5, 5, 215})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
