local widget = require("widget");
local addToShapeArray = require("utils.add-to-shape-array");
local t = {};

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;	--------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{3},{1},{1,1,5,1},{2},{1,1,6,1},{3},{1,1,7,1}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle3_2_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 3})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 4}, "up")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 3, 4}, "triangleTopRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 6, 5}, "up")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "down")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 5, 2}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{},{1},{1},{2,1,5,2},{2},{2,1,6,3}})
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 1, 4}, "right")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_1", {2, 1, 2, 4})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 7, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 1, 5}, "up")

    --GEMS    
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 7, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 3, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 2}, 150)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 4}, 90)
    addToShapeArray(sp, "item","coins", {2, 1, 3, 1}, 45)
    addToShapeArray(sp, "item","small-present", {2, 1, 7, 3}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 2, 5}, {})


end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
