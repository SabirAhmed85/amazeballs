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
    newShape("endPoint","endPoint1_1_1", {1, 1, 1, 1})
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleLeftAndRightShape", {1})
    newTransition("triangle1_1_1", "slide", {"green"}, {{1,1,2,2},{1,1,3,2}})
    newShape("shape","triangle2_1_1", {1, 1, 5, 2}, "triangleLeftAndRightShape", {2})
    newTransition("triangle2_1_1", "slide", {"green"}, {{1,1,5,2},{1,1,6,2}})
    newShape("door","door1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 2, 4}, "triangleTopAndBottomShape", {1})
    newTransition("triangle1_1_2", "slide", {"green"}, {{1,2,1,4},{1,2,2,4}})
    newShape("shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopAndBottomShape", {1})
    newTransition("triangle2_1_2", "slide", {"green"}, {{1,2,5,4},{1,2,6,4}})

    --GEMS
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","redCoin", {1, 2, 7, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 5}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 6, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 1}, 85)
    newShape("item","coins", {1, 2, 2, 5}, 150)
    newShape("item","coins", {1, 2, 6, 5}, 50)
    newShape("item","small-present", {1, 1, 3, 4}, {})

    newShape("item","clock", {1, 1, 1, 3 })
    newShape("item","clock", {1, 2, 7, 1 })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
