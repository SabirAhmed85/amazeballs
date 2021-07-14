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
    newShape("endPoint","endPoint1_1_1", {1, 1, 1, 1})
    newShape("manualFan","manualFan1_1_1", {1, 1, 6, 1}, "left")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,5,1},{1,1,6,1}})
    newShape("shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle2_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_1_1", {1, 1, 5, 4}, "left")
    newShape("autoFan","autoFan2_1_1", {1, 1, 4, 5}, "up")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,4,4},{1,1,4,5}})
    newShape("shape","triangle3_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1}, "up")
    newShape("shape","bar1_1_2", {1, 2, 5, 1}, "bar", {"vert", 3})
    newShape("shape","triangle1_1_2", {1, 2, 1, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 6, 2}, "down")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,5,2},{1,2,6,2}})
    newShape("shape","triangle2_1_2", {1, 2, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door","door1_1_2", {1, 2, 7, 3}, "right")
    newShape("shape","triangle3_1_2", {1, 2, 1, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","bar2_1_2", {1, 2, 2, 4}, "bar", {"horz", 3})
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 5}, "up")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,2,4},{1,2,4,5}})

    --SCREEN 2-2
    newShape("door","door1_2_2", {2, 2, 1, 1}, "left")
    newShape("shape","triangle1_2_2", {2, 2, 6, 1}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("item","map", {2, 2, 4, 3})
    newShape("door","door1_2_2", {2, 2, 1, 4}, "left")
    newShape("shape","bar1_2_2", {2, 2, 3, 4}, "bar", {"horz", 3})
    newTransition("bar1_2_2", "slide", {}, {{2,2,3,1},{2,2,3,2},{2,2,3,4}})
    newShape("shape","triangle2_2_2", {2, 2, 6, 4}, "triangleTopRightShape", {1, _, "breakable"})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {2, 2, 7, 1}, "purple")
    newShape("gem","purple", {2, 2, 6, 5}, "purple")
    newShape("gem","purple", {2, 2, 1, 1}, "purple")
    newShape("gem","purple", {2, 2, 3, 1}, "purple")
    newShape("gem","purple", {2, 2, 5, 1}, "purple")
    newShape("gem","purple", {2, 2, 1, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 4}, "purple")
    newShape("gem","purple", {2, 2, 5, 4}, "purple")
    newShape("gem","purple", {2, 2, 6, 3}, "purple")
    newShape("gem","purple", {2, 2, 6, 2}, "purple")
    newShape("gem","redCoin", {1, 2, 7, 2}, "redCoin")
    newShape("gem","blueCoin", {2, 2, 7, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 3, 4}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 4, 1}, 170)
    newShape("item","coins", {1, 2, 2, 2}, 70)
    newShape("item","big-present", {1, 1, 7, 5}, {})
    newShape("item","small-present", {2, 2, 7, 1}, {})
    newShape("item","characterSpecial", {1, 2, 3, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
