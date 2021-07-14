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
    newShape("door","door1_1_2", {1, 2, 4, 1}, "up")
    newShape("shape","bar1_1_2", {1, 2, 1, 2}, "bar", {"vert", 3})
    newShape("shape","bar2_1_2", {1, 2, 2, 2}, "bar", {"vert", 3})
    newShape("shape","bar3_1_2", {1, 2, 3, 2}, "bar", {"vert", 3})
    newShape("shape","bar4_1_2", {1, 2, 5, 2}, "bar", {"vert", 1})
    newShape("shape","bar5_1_2", {1, 2, 6, 2}, "bar", {"vert", 3})
    newShape("shape","bar6_1_2", {1, 2, 7, 2}, "bar", {"vert", 2})
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleTopRightShape")
    newTransition("triangle1_1_2", "slide", {"green"}, {{1,2,4,3},{1,2,6,2},{1,2,7,2}})
    newShape("shape","bar7_1_2", {1, 2, 4, 3}, "bar", {"horz", 2})
    newShape("shape","triangle2_1_2", {1, 2, 2, 4}, "triangleBottomLeftShape")
    newTransition("triangle2_1_2", "slide", {"green"}, {{1,2,2,3},{1,2,2,4},{1,2,3,2}})
    newShape("shape","triangle3_1_2", {1, 2, 7, 4}, "triangleTopLeftShape")
    newTransition("triangle3_1_2", "slide", {"green"}, {{1,2,5,4},{1,2,5,5,"*"},{1,2,6,5},{1,2,6,4},{1,2,7,4}})

    --SCREEN 2-1
    newShape("shape","triangle1_1_1", {1, 1, 1, 2}, "triangleTopAndBottomShape", {2})
    newShape("simple","simple1_1_1", {1, 1, 4, 1})
    newTransition("simple1_1_1", "slide", {"green"}, {{1,1,4,1},{1,1,4,2}})
    newShape("shape","bar1_1_1", {1, 1, 8, 2}, "bar", {"horz", 2})
    newShape("shape","triangle2_1_1", {1, 1, 4, 3}, "triangleLeftAndRightShape", {2})
    newShape("shape","triangle3_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1})
    newShape("shape","triangle4_1_1", {1, 1, 6, 3}, "triangleLeftAndRightShape", {2})
    newTransition("triangle4_1_1", "slide", {"green"}, {{1,1,6,2},{1,1,6,3}})
    newShape("shape","triangle5_1_1", {1, 1, 1, 4}, "triangleTopAndBottomShape", {1})
    newShape("shape","triangle6_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1})
    newShape("endPoint","endPoint1_1_1", {1, 1, 7, 4})
    --newShape("timeOut","timeOut1_1_1", {1, 1, 4, 5})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","redCoin", {1, 1, 6, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 6, 1}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 1, 3}, "purpleCoin")

    newShape("item","coins", {1, 1, 7, 1}, 80)
    newShape("item","coins", {1, 2, 3, 5}, 120)
    newShape("item", "small-present", {1, 2, 1, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
