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
    newShape("gun","gun1_1_1", {1, 1, 3, 2}, "down")
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 3}, "right")
    newShape("autoFan","autoFan1_1_1", {1, 1, 5, 3}, "down")
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 3}, "left")
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 5}, "left")
    newShape("door","door1_1_1", {1, 1, 5, 5}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 6, 5}, "triangleTopRightShape", {1, _, "fire"})

    --SCREEN 1-2
    newShape("spitter","spitter1_1_2", {1, 2, 5, 1}, {"none","right","down","none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,1,1},{1,2,5,1},{1,2,6,1}})
    newShape("gun","gun1_1_2", {1, 2, 2, 2}, "right")
    newShape("endPoint","endPoint1_1_2", {1, 2, 4, 3})
    newShape("shape","triangle1_1_2", {1, 2, 1, 4}, "triangleTopRightShape", {1, _, "fire"})
    newShape("gem","redCoin", {1, 2, 1, 5}, "redCoin")
    newShape("manualFan","manualFan1_1_2", {1, 2, 4, 5}, "up")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,4,4},{1,2,4,5}})

    --GEMS
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","redCoin", {1, 1, 7, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 6, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 2, 4}, 110)
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
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
