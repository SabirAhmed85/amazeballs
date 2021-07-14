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
    newShape("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("simple","simple1_1_1", {1, 1, 7, 2})
    newShape("shape","triangle4_1_1", {1, 1, 1, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 3, 4}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("manualFan","manualFan2_1_1", {1, 1, 3, 5}, "up")
    newShape("autoFan","autoFan1_1_1", {1, 1, 5, 5}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("manualFan","manualFan1_1_2", {1, 2, 2, 2}, "right")
    newTransition("manualFan1_1_2", "autoSlide", {}, {{1,2,2,2},{1,2,2,4}})
    newShape("manualFan","manualFan2_1_2", {1, 2, 3, 2}, "down")
    newTransition("manualFan2_1_2", "autoSlide", {}, {{1,2,3,2},{1,2,3,4}})
    newShape("simple","simple1_1_2", {1, 2, 5, 2})
    newTransition("simple1_1_2", "slide", {}, {{1,2,5,1},{1,2,5,2},{1,2,5,3},{1,2,5,4}})
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleTopLeftShape", {1, 6})
    newShape("shape","triangle1_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("shape","bar1_1_2", {1, 2, 3, 4}, "bar", {"vert", 2})
    newShape("shape","bar2_1_2", {1, 2, 4, 4}, "bar", {"horz", 4})
    newShape("endPoint","endPoint", 1, 2, 3, 5})
    --GEMS
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","redCoin", {1, 2, 4, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 7, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 6, 4}, 70)
    newShape("item","coins", {1, 1, 7, 5}, 50)
    newShape("item","small-present", {1, 2, 2, 1}, {})

    newShape("item","big-present", {1, 2, 1, 3}, {})



end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
