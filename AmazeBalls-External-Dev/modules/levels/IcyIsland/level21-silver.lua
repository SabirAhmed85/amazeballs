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
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "down")
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 2}, "left")
    newShape("shape","triangle1_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 4}, "right")
    newShape("autoFan","autoFan3_1_1", {1, 1, 6, 4}, "up")
    newShape("shape","bar1_1_1", {1, 1, 2, 6}, "bar", {"vert", 4})
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 1-2
    newShape("shape","bar1_1_2", {1, 2, 1, 1}, "bar", {"vert", 3})
    newShape("shape","bar2_1_2", {1, 2, 2, 1}, "bar", {"vert", 3})
    --newShape("timeOut","timeOut1_1_2", {1, 2, 4, 1, 2})
    newShape("door","door1_1_2", {1, 2, 6, 1}, "up")
    newShape("manualFan","manualFan1_1_2", {1, 2, 1, 2}, "down")
    newShape("shape","triangle1_1_2", {1, 2, 2, 3}, "triangleTopRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,3},{1,2,2,3}})
    newShape("shape","triangle2_1_2", {1, 2, 4, 3}, "triangleLeftAndRightShape", {2})
    newTransition("triangle2_1_2", "flip-horizontal")
    newShape("door","door2_1_2", {1, 2, 7, 3}, "right")

    --SCREEN 2-2
    newShape("endPoint","endPoint1_2_2", {2, 2, 4, 3})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {2, 2, 1, 3}, "purple")
    newShape("gem","purple", {2, 2, 3, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 3, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 2, 4}, "blueCoin")
    newShape("gem","purpleCoin", {2, 2, 2, 3}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 4, 1}, 170)
    newShape("item","coins", {1, 2, 7, 3}, 80)
    newShape("item","small-present", {1, 1, 3, 4}, {})
    newShape("item","characterSpecial", {1, 2, 3, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
