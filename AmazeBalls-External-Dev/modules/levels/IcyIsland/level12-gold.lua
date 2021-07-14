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
    newShape("item","map", {1, 1, 1, 1})
    newShape("tunnel","tunnel1_1_1", {1, 1, 3, 1, 1, 1, 7, 5, "none"})
    newTransition("tunnel1_1_1", "slide", {}, {{1,1,1,2},{1,1,3,1}})
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "flip-horizontal")
    newShape("manualFan","manualFan1_1_1", {1, 1, 4, 2}, "right")
    newShape("tunnel","tunnel2_1_1", {1, 1, 2, 3, 1, 1, 5, 2, "none"})
    newTransition("tunnel2_1_1", "slide", {}, {{1,1,1,3},{1,1,2,3}})
    newShape("shape","triangle2_1_1", {1, 1, 5, 3}, "triangleBottomRightShape")
    newShape("tunnel","tunnel3_1_1", {1, 1, 3, 4, 2, 1, 6, 3, "none"})
    newTransition("tunnel3_1_1", "slide", {}, {{1,1,1,4},{1,1,3,4}})
    newShape("manualFan","manualFan2_1_1", {1, 1, 4, 4}, "left")
    newShape("shape","triangle3_1_1", {1, 1, 6, 4}, "triangleTopAndBottomShape", {2})
    newTransition("triangle3_1_1", "flip-vertical")
    newShape("manualFan","manualFan3_1_1", {1, 1, 2, 5}, "down")
    newTransition("manualFan3_1_1", "slide", {}, {{1,1,2,5},{1,1,4,5}})

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleLeftAndRightShape", {1})
    newShape("manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    newShape("autoFan","autoFan1_2_1", {2, 1, 6, 1}, "left")
    newShape("shape","triangle2_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,5,2},{2,1,7,1}})
    newShape("manualFan","manualFan2_2_1", {2, 1, 1, 3}, "up")
    newShape("manualFan","manualFan3_2_1", {2, 1, 4, 3}, "down")
    newShape("shape","triangle3_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, 5})
    newShape("shape","triangle4_2_1", {2, 1, 1, 4}, "triangleBottomLeftShape")
    newShape("shape","bar1_2_1", {2, 1, 5, 4}, "bar", {"horz", 3})
    newShape("endPoint","endPoint1_2_1", {2, 1, 5, 4})
    newShape("shape","bar2_2_1", {2, 1, 6, 4}, "bar", {"horz", 3})
    newShape("shape","triangle5_2_1", {2, 1, 3, 5}, "triangleTopRightShape")
    newShape("manualFan","manualFan4_2_1", {2, 1, 7, 5}, "up")
    newTransition("manualFan4_2_1", "slide", {}, {{2,1,6,5},{2,1,7,5}})

    --GEMS
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 3}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 5, 1}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 3, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 3}, 12)
    newShape("item","coins", {2, 1, 4, 1}, 90)
    newShape("item","small-present", {2, 1, 2, 1}, {})

    newShape("item","small-present", {2, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
