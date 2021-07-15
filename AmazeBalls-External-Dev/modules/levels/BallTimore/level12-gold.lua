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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","bar1_1_1", {1, 1, 1, 2}, "bar", {"horz", 3})
    newShape("simple","simple1_1_1", {1, 1, 5, 2})
    newShape("shape","triangle3_1_1", {1, 1, 2, 3}, "triangleBottomRightShape")
    newTransition("triangle3_1_1", "flip-vertical")
    newShape("shape","triangle4_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    newTransition("triangle4_1_1", "flip-horizontal")
    newShape("shape","triangle5_1_1", {1, 1, 1, 5}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,2},{1,2,1,1,"*"},{1,2,2,1}})
    newShape("endPoint","endPoint1_1_2", {1, 2, 4, 1})
    newShape("shape","bar1_1_2", {1, 2, 2, 2}, "bar", {"vert", 2})
    newShape("manualFan","manualFan1_1_2", {1, 2, 2, 2}, "up")
    newShape("autoFan","autoFan1_1_2", {1, 2, 5, 2}, "down")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 4, 3}, "up")
    newShape("shape","bar2_1_2", {1, 2, 7, 3}, "bar", {"horz", 3})
    newShape("backFire","backFire1_1_2", {1, 2, 4, 4})
    newShape("manualFan","manualFan1_1_2", {1, 2, 7, 4}, "up")
    newShape("backFire","backFire2_1_2", {1, 2, 1, 5})
    newTransition("backFire2_1_2", "slide", {}, {{1,2,1,5},{1,2,1,4},{1,2,2,3}})
    newShape("shape","triangle1_1_2", {1, 2, 5, 5}, "triangleTopAndBottomShape", {1})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 5, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 7, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 7, 1}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 3, 2}, 70)
    newShape("item","coins", {1, 1, 7, 3}, 105)
    newShape("item","coins", {1, 2, 5, 4}, 14)
    newShape("item","small-present", {1, 1, 4, 1}, {})

    newShape("item","small-present", {1, 2, 6, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
