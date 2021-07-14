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
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopLeftShape")
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape")
    newShape("door","door2_1_1", {1, 1, 7, 2}, "right")
    newShape("shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, 7})
    newShape("shape","triangle4_1_1", {1, 1, 4, 3}, "triangleBottomRightShape", {1, 8})
    newShape("door","door3_1_1", {1, 1, 7, 3}, "right")
    newShape("autoFan","autoFan1_1_1", {1, 1, 4, 4}, "right")
    newShape("item","map", {1, 1, 5, 4})
    newShape("simple","simple1_1_1", {1, 1, 7, 4})
    newTransition("simple1_1_1", "slide", {"lightBlue"}, {{1,1,7,1},{1,1,7,2},{1,1,7,3},{1,1,7,4},{1,1,7,5} })
    newShape("door","door4_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 1-2
    newShape("autoFan","autoFan1_2_1", {2, 1, 4, 2}, "right")
    newShape("endPoint","endPoint1", 2, 1, 6, 2})
    newShape("shape","triangle1_2_1", {2, 1, 4, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {2, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 1, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 5}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 4, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 3, 40)
    newShape("item","small-present", {1, 1, 5, 5}, {})

    newShape("item","big-present", {1, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t