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
    newShape("tunnel","tunnel1_1_1", {1, 1, 4, 1, 1, 1, 2, 5}, "right")
    --newShape("item","coins", {1, 1, 2, 2}, 50)
    newShape("shape","triangle1_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 5}, "left")
    newShape("shape","bar1_1_1", {1, 1, 5, 6}, "bar", {"vert", 2})
    newShape("tunnel","tunnel2_1_1", {1, 1, 6, 5, 1, 2, 2, 1}, "down")

    --SCREEN 1-2
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 2}, "right")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,1,2},{1,2,2,2}})
    newShape("tunnel","tunnel1_1_2", {1, 2, 4, 2, 1, 2, 6, 1}, "down")
    newShape("autoFan","autoFan2_1_2", {1, 2, 1, 4}, "right")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,1,4},{1,2,2,4}})
    newShape("tunnel","tunnel2_1_2", {1, 2, 4, 4, 1, 2, 7, 1}, "down")
    newShape("endPoint","endPoint1_1_2", {1, 2, 6, 5})
    newShape("shape","bar1_1_2", {1, 2, 7, 6}, "bar", {"vert", 2})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","redCoin", {1, 2, 6, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 2, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 7, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 2, 40)
    newShape("item","coins", {1, 2, 7, 3}, 250)
    newShape("item","coins", {1, 1, 4, 5}, 65)
    newShape("item","small-present", {1, 1, 4, 4}, {})


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
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
