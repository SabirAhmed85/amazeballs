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
    newShape("shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopRightShape")
    newTransition("triangle1_1_1", "flip-horizontal")
    newShape("shape","triangle2_1_1", {1, 1, 1, 5}, "triangleBottomRightShape")
    newShape("shape","triangle3_1_1", {1, 1, 5, 5}, "triangleBottomRightShape")
    newTransition("triangle3_1_1", "flip-horizontal")
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")

    --SCREEN 2-1
    newShape("manualFan","manualFan1_1_2", {1, 2, 7, 1}, "down")
    newShape("shape","triangle1_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newTransition("triangle1_1_2", "slide", {"green"}, {{1,2,1,4},{1,2,2,4}})
    newShape("shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopRightShape", {1, 13})
    newTransition("triangle2_1_2", "flip-horizontal")
    newShape("shape","triangle3_1_2", {1, 2, 2, 5}, "triangleTopRightShape")
    newTransition("triangle3_1_2", "slide", {"green"}, {{1,2,1,5},{1,2,2,5}})
    newShape("endPoint","endPoint1_1_2", {1, 2, 7, 5})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 7, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 4, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 4, 5}, 75)
    newShape("item","small-present", {1, 2, 5, 2}, {})

    newShape("item","big-present", {1, 2, 7, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
