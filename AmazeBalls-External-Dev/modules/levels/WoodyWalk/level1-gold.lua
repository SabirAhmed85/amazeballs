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
    newShape("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleTopRightShape")
    newShape("shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleTopRightShape")
    newTransition("triangle3_1_1", "slide", {"green"}, {{1,1,3,1},{1,1,3,2},{1,1,5,3}})
    newShape("shape","triangle4_1_1", {1, 1, 4, 3}, "triangleBottomRightShape")
    newShape("shape","triangle5_1_1", {1, 1, 7, 3}, "triangleTopLeftShape")
    newTransition("triangle5_1_1", "slide", {"green"}, {{1,1,7,2},{1,1,7,3}})
    newShape("shape","triangle6_1_1", {1, 1, 2, 5}, "triangleTopLeftShape")
    newShape("endPoint","endPoint1_1_1", {1, 1, 2, 4})
    newShape("shape","triangle7_1_1", {1, 1, 6, 5}, "triangleTopAndBottomShape", {2})
    newTransition("triangle7_1_1", "slide", {"green"}, {{1,1,4,5},{1,1,5,5},{1,1,6,5}})

    --SCREEN 1-2
    newShape("shape","triangle1_2_1", {2, 1, 7, 3}, "triangleTopLeftShape")
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")

    --GEMS
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","redCoin", {2, 1, 3, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 6, 1}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 2, 1}, "purpleCoin")

    --ITEMS   
    newShape("item","coins", {1, 1, 1, 3}, 75)
    newShape("item","coins", {2, 1, 5, 3}, 90)
    newShape("item","coins", {1, 1, 5, 4, 175})
    newShape("item","small-present", {2, 1, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
