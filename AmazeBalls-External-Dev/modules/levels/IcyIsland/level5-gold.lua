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
    newShape("simple","simple1_1_1", {1, 1, 4, 1})
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle2_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_1_1", {1, 1, 7, 2}, "left")
    newTransition("autoFan1_1_1", "autoSlide", {timePerSquare = 600, pauseTime = 0}, {{1,1,6,2},{1,1,7,2}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 3}, "left")
    newTransition("autoFan2_1_1", "autoSlide", {timePerSquare = 600, pauseTime = 0}, {{1,1,6,3},{1,1,7,3}})
    newShape("shape","triangle3_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, 9, "icy"})
    newShape("shape","bar1_1_1", {1, 1, 7, 4}, "bar", {"vert", 4})
    newShape("shape","triangle4_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle5_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape")
    newShape("door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleTopRightShape", {1, _, "icy"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 2, 1}, "up")
    newShape("autoFan","autoFan1_1_2", {1, 2, 3, 1}, "down")
    newShape("manualFan","manualFan2_1_2", {1, 2, 7, 1}, "right")
    newShape("manualFan","manualFan3_1_2", {1, 2, 2, 2}, "down")
    newShape("autoFan","autoFan2_1_2", {1, 2, 5, 2}, "left")
    newShape("autoFan","autoFan3_1_2", {1, 2, 2, 3}, "right")
    newShape("tunnel","tunnel1_1_2", {1, 2, 4, 3, 2, 2, 2, 3, "none"})
    newShape("manualFan","manualFan4_1_2", {1, 2, 5, 3}, "up")
    newShape("manualFan","manualFan5_1_2", {1, 2, 7, 3}, "left")
    newShape("item","map", {1, 2, 2, 4})
    newShape("manualFan","manualFan6_1_2", {1, 2, 3, 4}, "left")
    newShape("manualFan","manualFan7_1_2", {1, 2, 5, 4}, "right")
    newShape("shape","bar1_1_2", {1, 2, 7, 4}, "bar", {"horz", 2})
    newShape("autoFan","autoFan4_1_2", {1, 2, 7, 4}, "down")
    newShape("manualFan","manualFan8_1_2", {1, 2, 1, 5}, "down")
    newShape("autoFan","autoFan5_1_2", {1, 2, 2, 5}, "right")
    newShape("manualFan","manualFan9_1_2", {1, 2, 4, 5}, "up")
    newShape("manualFan","manualFan10_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    newShape("autoFan","autoFan1_2_2", {2, 2, 1, 1}, "right")
    newShape("manualFan","manualFan1_2_2", {2, 2, 4, 1}, "down")
    newShape("shape","bar1_2_2", {2, 2, 6, 1}, "bar", {"horz", 4})
    newShape("manualFan","manualFan2_2_2", {2, 2, 7, 1}, "left")
    newShape("endPoint","endPoint1_2_2", {2, 2, 3, 2})
    newShape("manualFan","manualFan3_2_2", {2, 2, 6, 2}, "left")
    newShape("shape","triangle1_2_2", {2, 2, 1, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape","triangle1_2_2", {2, 2, 4, 3}, "triangleBottomLeftShape", {1, 4, "icy"})
    newShape("shape","triangle1_2_2", {2, 2, 7, 3}, "triangleTopRightShape")
    newShape("autoFan","autoFan2_2_2", {2, 2, 1, 4}, "right")
    newShape("manualFan","manualFan4_2_2", {2, 2, 6, 4}, "up")
    newShape("manualFan","manualFan5_2_2", {2, 2, 1, 5}, "down")
    newShape("shape","triangle1_2_2", {2, 2, 2, 5}, "triangleTopLeftShape", {1, 5, "icy"})
    newShape("shape","triangle1_2_2", {2, 2, 4, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("manualFan","manualFan6_2_2", {2, 2, 5, 5}, "up")
    newShape("shape","triangle1_2_2", {2, 2, 6, 5}, "triangleTopAndBottomShape", {2})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {2, 2, 6, 1}, "purple")
    newShape("gem","purple", {2, 2, 4, 2}, "purple")
    newShape("gem","purple", {2, 2, 3, 3}, "purple")
    newShape("gem","redCoin", {2, 2, 4, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 3, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 5, 5}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 5, 3}, 165)
    newShape("item","coins", {1, 2, 6, 3, 125})
    newShape("item","coins", {2, 2, 6, 3, 125})
    newShape("item","small-present", {1, 1, 2, 2}, {})
    newShape("item","small-present", {1, 2, 5, 5}, {})
    newShape("item","clock", {2, 2, 4, 2}, {})
    newShape("item","fireCape", {1, 1, 6, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
