local t = {}
local getShapeArray = require(".utils.get-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local newShape = function(type, name, location, subType, props)
        addToShapeArray(shapeArrayParameters, type, name, location, subType, props);
    end
    local newTransition = function(shapeName, transitionType, props, positionArray)
        addToTransitionArray(mainFunc.allLevelSettings.transitionArrayIndex, shapeArrayParameters, shapeName, transitionType, props, positionArray);
    end
    -- SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, 8}))
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle2_1_1", {1, 1, 5, 1}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape", "bar1_1_1", {1, 1, 1, 2}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("backFire", "backFire1_1_1", {1, 1, 2, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{"backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,1,3},{1,1,2,3},{1,1,3,3}}})
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle4_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape", {1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{"triangle4_1_1", "slide", {}, {{1,1,6,3},{1,1,6,4}}})
    table.insert(shapeArrayParameters, getShapeArray("shape", "bar2_1_1", {1, 1, 2, 5}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle5_1_1", {1, 1, 3, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("door", "door1_1_1", {1, 1, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape", "bar3_1_1", {1, 1, 1, 5}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint", "endPoint1_1_1", {1, 1, 2, 5}))
    table.insert(shapeArrayParameters, getShapeArray("simple", "simple1_1_1", {1, 1, 4, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{"simple1_1_1", "slide", {}, {{1,1,4,4},{1,1,4,5}}})
    table.insert(shapeArrayParameters, getShapeArray("simple", "simple2_1_1", {1, 1, 6, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{"simple2_1_1", "slide", {}, {{1,1,5,5},{1,1,6,5}}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle1_2_1", {2, 1, 1, 1}, "triangleTopAndBottomShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape", "bar1_2_1", {2, 1, 7, 1}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{"bar1_2_1", "slide", {"brown"}, {{2,1,7,1},{2,1,7,2}}})
    table.insert(shapeArrayParameters, getShapeArray("door", "door1_2_1", {2, 1, 1, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle2_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door", "door2_2_1", {2, 1, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle3_2_1", {2, 1, 5, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape", "bar2_2_1", {2, 1, 1, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape", "triangle4_2_1", {2, 1, 4, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{"triangle4_2_1", "slide", {}, {{2,1,1,4},{2,1,2,4},{2,1,2,5,"*"},{2,1,4,5}}})

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {1, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {2, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "redCoin", {2, 1, 1, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "blueCoin", {1, 1, 2, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem", "purpleCoin", {2, 1, 1, 3}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item", "coins", {1, 1, 4, 1}, 250))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
