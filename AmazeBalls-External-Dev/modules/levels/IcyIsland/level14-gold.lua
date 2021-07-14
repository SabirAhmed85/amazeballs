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

    --SCREEN 1-1
    newShape("characterChangePoint","characterChangePoint1_1_1", {1, 1, 2, 1})
    newShape("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("shape","triangle3_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    newTransition("triangle3_1_1", "flip-horizontal")
    newShape("endPoint","endPoint1_1_1", {1, 1, 6, 3})
    newShape("autoFan","autoFan1_1_1", {1, 1, 1, 4}, "down")
    newShape("shape","triangle4_1_1", {1, 1, 2, 4}, "triangleBottomLeftShape")
    newTransition("triangle4_1_1", "flip-horizontal")

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 2, 1}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("shape","triangle2_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 6, 2}, "down")
    newShape("shape","triangle3_2_1", {2, 1, 2, 3}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape")
    newTransition("triangle4_2_1", "slide", {}, {{2,1,5,3},{2,1,7,3},{2,1,7,1}})
    newShape("door","door2_2_1", {2, 1, 1, 4}, "left")
    newShape("autoFan","autoFan2_2_1", {2, 1, 3, 4}, "left")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,3,4},{2,1,4,4}})
    newShape("simple","simple1_2_1", {2, 1, 6, 4})
    newTransition("simple1_2_1", "slide", {}, {{2,1,6,4},{2,1,7,4}})
    newShape("shape","triangle5_2_1", {2, 1, 2, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle6_2_1", {2, 1, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape","bar1_2_1", {2, 1, 7, 6}, "bar", {"vert", 2})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 2}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 5, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 1, 2}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 7, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 5, 3}, 85)
    newShape("item","coins", {2, 1, 5, 1}, 65)
    newShape("item","small-present", {1, 1, 5, 4}, {})

    newShape("item","small-present", {2, 1, 4, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
