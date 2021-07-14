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
    newShape("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,3,1},{1,1,4,1}})
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("endPoint","endPoint1_1_1", {1, 1, 1, 2})
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape","triangle3_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle4_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door","door1_1_1", {1, 1, 7, 3}, "right")
    newShape("shape","triangle5_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape","triangle6_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 5}, "up")

    --SCREEN 2-1
    newShape("manualFan","manualFan1_2_1", {2, 1, 3, 1}, "right")
    newTransition("manualFan1_2_1", "slide", {}, {{2,1,1,1},{2,1,3,1},{2,1,4,1}})
    newShape("shape","triangle1_2_1", {2, 1, 1, 2}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomLeftShape", {1, 3, "breakable"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 3, 2}, "down")
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left", {"disabled"})
    newShape("shape","triangle3_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, 3, "breakable"})
    newShape("shape","triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("characterChangePoint","characterChangePoint1_2_1", {2, 1, 4, 3})
    newShape("autoFan","autoFan2_2_1", {2, 1, 6, 3}, "down")
    newShape("shape","triangle5_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape")
    newTransition("triangle5_2_1", "slide", {}, {{2,1,6,1},{2,1,7,2},{2,1,7,3}})
    newShape("door","door2_2_1", {2, 1, 1, 5}, "left")
    newShape("manualFan","manualFan2_2_1", {2, 1, 1, 5}, "down")
    newShape("manualFan","manualFan3_2_1", {2, 1, 4, 5}, "up")
    newShape("shape","triangle6_2_1", {2, 1, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 7, 1}, { {"door-open","door1_2_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 5}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {2, 1, 5, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 2}, "purple")
    newShape("gem","purple", {2, 1, 1, 4}, "purple")
    newShape("gem","purple", {2, 1, 3, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 3}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 7, 5}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 5, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 2}, 100)
    newShape("item","coins", {1, 1, 1, 3}, 70)
    newShape("item","small-present", {1, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
