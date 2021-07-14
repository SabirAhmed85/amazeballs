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
    newShape("tunnel","tunnel1_1_1", {1, 1, 5, 1, 1, 1, 6, 2}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,3,1},{1,1,3,2}})
    newShape("shape","triangle2_1_1", {1, 1, 7, 3}, "triangleBottomRightShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,7,3},{1,1,7,4}})
    newShape("manualFan","manualFan1_1_1", {1, 1, 3, 4}, "left")
    newShape("manualFan","manualFan2_1_1", {1, 1, 5, 5}, "up")
    newShape("tunnel","tunnel2_1_1", {1, 1, 6, 5, 1, 2, 2, 1}, {"none"})
    newShape("shape","triangle3_1_1", {1, 1, 7, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,1},{1,2,1,2}})
    newShape("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle3_1_2", {1, 2, 4, 2}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("endPoint","endPoint1_1_2", {1, 2, 1, 3})
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 4}, "left")
    newTransition("autoFan1_1_1", "slide", {}, {{1,2,1,4},{1,2,2,4}})
    newShape("autoFan","autoFan2_1_2", {1, 2, 5, 4}, "right")
    newTransition("autoFan2_1_1", "slide", {}, {{1,2,4,5},{1,2,4,4,"*"},{1,2,5,4},{1,2,6,2}})
    newShape("tunnel","tunnel1_1_2", {1, 2, 2, 5, 1, 1, 1, 1}, "right")
    newShape("item","map", {1, 2, 5, 5})
    newShape("manualFan","manualFan2_1_2", {1, 2, 6, 5}, "left")
    newShape("shape","bar1_1_2", {1, 2, 7, 5}, "bar", {"horz", 2})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","redCoin", {1, 2, 3, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 4, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 4, 1}, 75)
    newShape("item","coins", {1, 1, 4, 5}, 110)
    newShape("item","small-present", {1, 1, 1, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
