local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local newShape = function(type, name, location, subType, props)
        addToShapeArray(shapeArrayParameters, type, name, location, subType, props);
    end
    local newTransition = function(shapeName, transitionType, props, positionArray)
        addToTransitionArray(mainFunc.allLevelSettings.transitionArrayIndex, shapeArrayParameters, shapeName, transitionType, props, positionArray);
    end

    -- SCREEN 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 1}, "left")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,4,1},{1,1,6,1}})
    newShape("simple", "simple1_1_1", {1, 1, 1, 2})
    newTransition("simple1_1_1", "slide", {}, {{1,1,1,2},{1,1,2,2},{1,1,3,2}})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 3}, "left")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,6,3},{1,1,7,3},{1,1,7,4}})
    newShape("door", "door1_1_1", {1, 1, 1, 5}, "down")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 4, 5}, "up")
    newTransition("autoFan3_1_1", "slide", {}, {{1,1,4,4},{1,1,4,5},{1,1,5,3}})

    -- SCREEN 1-2
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 1}, "down")
    newShape("shape", "triangle1_1_2", {1, 2, 6, 1}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle2_1_2", {1, 2, 2, 2}, "triangleBottomRightShape", {1})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 3, 2}, "right")
    newShape("shape", "triangle3_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_2", {1, 2, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_2", {1, 2, 1, 4}, "triangleTopRightShape", {1})
    newShape("shape", "triangle6_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_2", {1, 2, 3, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar1_1_2", {1, 2, 5, 4}, "bar", {"horz", 2})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 7, 4}, "right")
    newShape("door", "door1_1_2", {1, 2, 7, 4}, "right")
    newShape("shape", "triangle5_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, 1, "breakable"})

    --SCREEN 2-1
    newShape("endPoint", "endPoint1_2_2", {2, 2, 3, 1})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 1}, "down")
    newShape("shape", "triangle1_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape", {1})
    newShape("shape", "triangle2_2_2", {2, 2, 2, 3}, "triangleBottomLeftShape", {1})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 6, 3}, "left")
    newTransition("autoFan2_2_2", "slide", {}, {{2,2,6,3},{2,2,7,4}})
    newShape("simple", "simple1_2_2", {2, 2, 3, 4})
    newTransition("simple1_2_2", "slide", {}, {{2,2,3,5},{2,2,3,4},{2,2,4,2},{2,2,5,1}})
    newShape("shape", "triangle3_2_2", {2, 2, 5, 4}, "triangleTopRightShape", {1})
    newShape("shape", "triangle4_2_2", {2, 2, 2, 5}, "triangleTopLeftShape", {1})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 5}, "right")

    --GEMS
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 2, 5, 5}, "purple")
    newShape("gem", "purple", {2, 2, 7, 5}, "purple")
    newShape("gem", "purple", {2, 2, 7, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "redCoin", {1, 2, 5, 4}, "redCoin")
    newShape("gem", "blueCoin", {2, 2, 3, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 2, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 3, 1}, 90)
    newShape("item", "coins", {1, 1, 4, 2}, 80)
    newShape("item", "coins", {1, 2, 5, 3, 30)
    newShape("item", "small-present", {1, 1, 4, 3}, {})

    newShape("item", "big-present", {1, 2, 5, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t