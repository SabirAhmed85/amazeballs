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
    newShape("spitter","spitter1_1_1", {1, 1, 2, 1}, {"none","right","none","none"})
    newTransition("spitter1_1_1", "slide", {"lightBlue"}, {{1,1,2,1},{1,1,2,3}})
    newShape("spitter","spitter2_1_1", {1, 1, 4, 2}, {"none","none","down","none"})
    newTransition("spitter2_1_1", "slide", {"lightBlue"}, {{1,1,4,1},{1,1,4,2}})
    newShape("shape","triangle1_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    newShape("door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("endPoint","endPoint1_2_1", {2, 1, 6, 1})
    newShape("shape","triangle1_2_1", {2, 1, 6, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("shape","triangle_2_1", {2, 1, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle3_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("spitter","spitter1_2_1", {2, 1, 1, 5}, {"none","right","none","none"})
    newShape("shape","triangle4_2_1", {2, 1, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 5}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 7, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 5}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 6, 4}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 4, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 6, 5}, 85)
    newShape("item","coins", {1, 1, 4, 3}, 50)
    newShape("item","coins", {2, 1, 3, 2}, 105})
    newShape("item","small-present", {2, 1, 7, 5}, {})


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
