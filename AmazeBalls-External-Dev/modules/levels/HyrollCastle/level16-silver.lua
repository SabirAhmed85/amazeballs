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
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 1}, "right")
    newShape("manualFan","manualFan2_1_1", {1, 1, 7, 1}, "down")
    newShape("shape","bar1_1_1", {1, 1, 8, 1}, "bar", {"horz", 4})
    newShape("shape","bar2_1_1", {1, 1, 2, 2}, "bar", {"vert", 3})
    newShape("shape","bar3_1_1", {1, 1, 3, 2}, "bar", {"vert", 3})
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopAndBottomShape", {1})
    newTransition("triangle1_1_1", "slide", {"orange"}, {{1,1,3,2},{1,1,4,2},{1,1,5,2}})
    newShape("shape","triangle2_1_1", {1, 1, 2, 3}, "triangleTopAndBottomShape", {2})
    newTransition("triangle2_1_1", "slide", {"orange"}, {{1,1,2,3},{1,1,3,3},{1,1,3,3}})
    newShape("shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    newTransition("triangle3_1_1", "slide", {"orange"}, {{1,1,1,5},{1,1,2,5},{1,1,3,5}})
    newShape("door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("endPoint","endPoint1_1_2", {1, 2, 1, 1})
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleTopLeftShape")
    newShape("shape","triangle2_1_2", {1, 2, 5, 2}, "triangleTopRightShape")
    newShape("autoFan","autoFan1_1_2", {1, 2, 5, 3}, "left")
    newShape("shape","bar1_1_2", {1, 2, 2, 3}, "bar", {"horz", 3})
    newTransition("bar1_1_2", "slide", {}, {{1,2,2,3},{1,2,2,4}})
    newShape("manualFan","manualFan1_1_2", {1, 2, 1, 3}, "up")
    newShape("shape","bar2_1_2", {1, 2, 1, 3}, "bar", {"horz", 3})
    newShape("manualFan","manualFan2_1_2", {1, 2, 1, 5}, "up")

    --GEMS
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 6, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 3, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 4, 4}, 90)
    newShape("item","coins", {1, 2, 1, 2}, 110)
    newShape("item","clock", {1, 1, 5, 1, "clock1_1_1", 10, 1})
    newShape("item","bomb", {1, 2, 5, 5, "bomb2_1_1", {3, "right", "left", "up"}, 3})
    newShape("item","big-present", {1, 2, 7, 5}, {})
    newShape("item","small-present", {1, 2, 2, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
