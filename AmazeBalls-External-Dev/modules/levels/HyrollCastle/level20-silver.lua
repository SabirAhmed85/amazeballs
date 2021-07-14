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
    newShape("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomLeftShape")
    newShape("shape","bar1_1_1", {1, 1, 6, 1}, "bar", {"horz"})
    newShape("simple","simple1_1_1", {1, 1, 7, 1})
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "left")
    newShape("item","map", {1, 1, 3, 2})
    newShape("shape","bar2_1_1", {1, 1, 4, 2}, "bar", {"horz", 3})
    newShape("backFire","backFire1_1_1", {1, 1, 5, 2})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,5,2},{1,1,5,5}})
    newShape("endPoint","endPoint1_1_1", {1, 1, 6, 2})
    newShape("autoFan","autoFan2_1_1", {1, 1, 7, 2}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    newShape("item","compass", {1, 1, 6, 4})
    newShape("shape","triangle4_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    newShape("shape","triangle5_1_1", {1, 1, 2, 5}, "triangleTopLeftShape", {1, 6})
    newShape("simple","simple2_1_1", {1, 1, 4, 5})
    newTransition("simple2_1_1", "slide", {}, {{1,1,4,4},{1,1,4,5}})
    newShape("shape","triangle6_1_1", {1, 1, 6, 5}, "triangleTopLeftShape", {1, 11, "breakable"})

    --SCREEN 1-2
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape","bar1_2_1", {2, 1, 1, 1}, "bar", {"vert", 2})
    newShape("shape","triangle1_2_1", {2, 1, 5, 1, "triangleTopAndBottomShape"})
    newShape("shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomLeftShape")
    newShape("autoFan","autoFan1_2_1", {2, 1, 3, 2}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,1,1},{2,1,3,2}})
    newShape("shape","bar2_2_1", {2, 1, 4, 2}, "bar", {"horz"})
    newShape("simple","simple1_2_1", {2, 1, 5, 2})
    newShape("shape","triangle3_2_1", {2, 1, 1, 3}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("simple","simple1_2_1", {2, 1, 4, 3})
    newShape("shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door","door1_2_1", {2, 1, 1, 5}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 1, 5}, "left")
    newShape("shape","triangle5_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    newShape("shape","triangle6_2_1", {2, 1, 5, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 5, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {2, 1, 6, 2}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {2, 1, 7, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 3, 5}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 6, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 4}, 150)
    newShape("item","coins", {2, 1, 6, 3}, 20)
    newShape("item","small-present", {2, 1, 2, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
