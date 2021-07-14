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
    newShape("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle2_1_1", {1, 1, 6, 1}, "triangleBottomRightShape")
    newShape("simple","simple1_1_1", {1, 1, 7, 1})
    newShape("shape","triangle3_1_1", {1, 1, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("shape","triangle5_1_1", {1, 1, 6, 4}, "triangleTopRightShape")
    newShape("door","door1_1_1", {1, 1, 2, 5}, "down")

    -- 1-2
    newShape("simple","simple1_1_2", {1, 2, 2, 1})
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 2}, "left")
    newShape("shape","triangle1_1_2", {1, 2, 2, 2}, "triangleTopRightShape")
    newShape("shape","triangle1_1_2", {1, 2, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","bar1_1_2", {1, 2, 7, 2}, "bar", {"horz"})
    newShape("endPoint","endPoint1_1_2", {1, 2, 7, 2})
    newShape("autoFan","autoFan2_1_2", {1, 2, 7, 3}, "up")
    newShape("autoFan","autoFan3_1_2", {1, 2, 1, 4}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 2, 4}, "triangleBottomRightShape")
    newShape("shape","triangle1_1_2", {1, 2, 4, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_2", {1, 2, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")

    --ITEMS
    --newShape("item","coins", {1, 1, 4, 4}, 500)
    --newShape("item","coins", {1, 2, 6, 3, 30)
    --newShape("item","coins", {1, 2, 5, 4}, 90)
    newShape("item","big-present", {1, 1, 5, 3}, {})

    newShape("item","small-present", {1, 2, 6, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t