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
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 1}, "down")
    newTransition("autoFan1_1_1", "slide", {"orange"}, {{1,1,2,1},{1,1,3,1}})
    newShape("shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {2})
    newShape("autoFan","autoFan2_1_1", {1, 1, 2, 2}, "right")
    newTransition("autoFan2_1_1", "slide", {"orange"}, {{1,1,2,2},{1,1,3,2}})
    newShape("simple","simple1_1_1", {1, 1, 4, 3})
    newTransition("simple1_1_1", "slide", {"lightBlue"}, {{1,1,4,3},{1,1,5,3}})
    newShape("shape","triangle2_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1})
    newTransition("triangle2_1_1", "slide", {"green"}, {{1,1,7,2},{1,1,7,3}})
    newShape("door","door1_1_1", {1, 1, 3, 5}, "down")
    newShape("endPoint","endPoint1_1_1", {1, 1, 5, 5})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 4, 1}, "up")
    newShape("autoFan","autoFan1_1_2", {1, 2, 2, 2}, "up")
    newTransition("autoFan1_1_2", "slide", {"orange"}, {{1,2,2,2},{1,2,2,3}})
    newShape("autoFan","autoFan2_1_2", {1, 2, 4, 3}, "up")
    newShape("shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1})
    newTransition("triangle2_1_2", "slide", {"green"}, {{1,2,5,3},{1,2,7,3}})
    newShape("simple","simple1_1_2", {1, 2, 5, 5})
    newTransition("simple1_1_2", "slide", {"lightBlue"}, {{1,2,3,5},{1,2,5,5}})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 1, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 5, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 2, 1}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 2, 4}, 45)
    newShape("item","coins", {1, 2, 5, 2}, 50)
    newShape("item","small-present", {1, 2, 5, 1}, {})

    newShape("item","big-present", {1, 1, 5, 4}, {})



end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t