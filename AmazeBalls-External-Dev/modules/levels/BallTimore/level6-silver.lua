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
    newShape("endPoint","endPoint1_1_1", {1, 1, 4, 1})
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("simple","simple1_1_1", {1, 1, 5, 2})
    newShape("gun","gun1_1_1", {1, 1, 2, 3}, "right")
    newShape("spitter","spitter1_1_1", {1, 1, 3, 5, "up","none","none","none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,1,5},{1,1,3,5},{1,1,4,5},{1,1,6,5}})
    newShape("shape","bar1_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1}, "up")
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 1}, "down")
    newShape("autoFan","autoFan2_1_2", {1, 2, 4, 2}, "down")
    newShape("autoFan","autoFan3_1_2", {1, 2, 7, 2}, "left")
    newShape("shape","triangle1_1_2", {1, 2, 1, 3}, "triangleTopAndBottomShape", {1})
    newShape("shape","triangle2_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopRightShape", {1, 24, "breakable"})
    newShape("shape","bar1_1_2", {1, 2, 2, 4}, "bar", {"vert", 3})
    newShape("shape","triangle4_1_2", {1, 2, 4, 5}, "triangleTopRightShape")
    newShape("shape","triangle5_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","redCoin", {1, 2, 1, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 1, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 1, 1}, 85)
    newShape("item","coins", {1, 2, 6, 1}, 130)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
