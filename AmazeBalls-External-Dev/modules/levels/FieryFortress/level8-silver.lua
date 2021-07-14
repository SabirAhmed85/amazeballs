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
    
    -- 1-1
    newShape("simple", "simple1_1_1", {1, 1, 2, 1})
    newShape("backFire", "backFire1_1_1", {1, 1, 3, 1})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 1, 2}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("shape", "bar1_1_1", {1, 1, 5, 2}, "bar", {"vert", 3})
    newShape("shape", "bar2_1_1", {1, 1, 6, 2}, "bar", {"vert", 3})
    newShape("shape", "triangle2_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape")
    newShape("shape", "triangle3_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 4}, "up")
    newShape("door", "door1_1_1", {1, 1, 1, 5}, "down")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 2, 5}, "right")
    newTransition("autoFan3_1_1", "slide", {}, {{1,1,2,5},{1,1,3,5}})
    newShape("shape", "triangle5_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    newShape("simple", "simple1_1_2", {1, 2, 5, 1})
    newTransition("simple1_1_2", "slide", {}, {{1,2,3,1},{1,2,5,1}})

    newShape("simple", "simple2_1_2", {1, 2, 7, 2})
    newTransition("simple2_1_2", "slide", {}, {{1,2,5,2},{1,2,7,2}})

    newShape("endPoint", "endPoint1_1_2", {1, 2, 2, 3})

    newShape("shape", "triangle1_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1, _, "breakable"})

    newShape("simple", "simple3_1_2", {1, 2, 4, 3})
    newTransition("simple3_1_2", "slide", {}, {{1,2,4,3},{1,2,7,3}})

    newShape("simple", "simple4_1_2", {1, 2, 6, 4})
    newTransition("simple4_1_2", "slide", {}, {{1,2,1,4},{1,2,4,4},{1,2,6,4}})

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 5, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 2, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 7, 5}, 50)
    newShape("item", "small-present", {1, 1, 7, 5}, {})

    newShape("item", "big-present", {1, 2, 2, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t