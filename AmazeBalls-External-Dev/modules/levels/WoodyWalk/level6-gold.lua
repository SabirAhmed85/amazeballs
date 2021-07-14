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
    newShape("shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"vert", 3})
    newShape("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "slide", {"green"}, {{1,1,4,1},{1,1,4,2,"*"},{1,1,5,2}})
    newShape("shape","bar2_1_1", {1, 1, 2, 2}, "bar", {"vert"})
    newTransition("bar2_1_1", "slide", {"brown"}, {{1,1,1,2},{1,1,2,2},{1,1,3,2}})
    newShape("endPoint","endPoint1_1_1", {1, 1, 7, 2})
    newShape("shape","bar3_1_1", {1, 1, 1, 4}, "bar", {"vert", 3})
    newTransition("bar3_1_1", "slide", {"brown"}, {{1,1,1,4},{1,1,3,4}})
    newShape("shape","triangle2_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape", {1})
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")
    newShape("shape","triangle3_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1})
    newTransition("triangle3_1_1", "slide", {"green"}, {{1,1,4,5},{1,1,5,4}})
    newShape("door","door2_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1}, "up")
    newShape("door","door1_1_2", {1, 2, 7, 1}, "up")
    newShape("item","map", {1, 2, 3, 1})
    newShape("simple","simple1_1_2", {1, 2, 3, 2})
    newTransition("simple1_1_2", "slide", {"lightBlue"}, {{1,2,3,2},{1,2,4,2},{1,2,5,2}})
    newShape("shape","triangle1_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newShape("shape","triangle2_1_2", {1, 2, 3, 4}, "triangleTopAndBottomShape", {1})
    newShape("shape","triangle3_1_2", {1, 2, 7, 4}, "triangleTopLeftShape")
    newShape("shape","triangle4_1_2", {1, 2, 3, 5}, "triangleBottomRightShape")
    newShape("shape","triangle5_1_2", {1, 2, 6, 5}, "triangleTopLeftShape")
    newTransition("triangle5_1_2", "slide", {}, {{1,2,5,5},{1,2,6,5}})

    --GEMS
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","redCoin", {1, 2, 5, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 1, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 5, 1}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 7, 5}, 50)
    newShape("item","coins", {1, 2, 7, 1}, 90)
    newShape("item","small-present", {1, 1, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
