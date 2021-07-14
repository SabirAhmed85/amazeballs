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
    newShape("shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("gun","gun1_1_1", {1, 1, 3, 1}, "down")
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 6, 2})
    newShape("shape","triangle3_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1})
    newTransition("triangle3_1_1", "flip-vertical")
    newShape("simple","simple1_1_1", {1, 1, 7, 4})
    newShape("shape","triangle4_1_1", {1, 1, 6, 5}, "triangleTopRightShape", {1, _, "fire"})

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle3_2_1", {2, 1, 5, 2}, "triangleTopRightShape")
    newTransition("triangle3_2_1", "flip-horizontal")
    newShape("shape","bar1_2_1", {2, 1, 8, 3}, "bar", {"horz"})
    newTransition("bar1_2_1", "switchSlide", {}, {{2,1,8,3},{2,1,8,4}})
    newShape("door","door1_2_1", {2, 1, 1, 4}, "left")
    newShape("shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape","bar2_2_1", {2, 1, 5, 4}, "bar", {"horz"})

    --SCREEN 3-1
    newShape("gun","gun1_3_1", {3, 1, 2, 1}, "down")
    newShape("manualFan","manualFan1_3_1", {3, 1, 4, 2}, "down")
    newShape("manualFan","manualFan2_3_1", {3, 1, 6, 3}, "left")
    newTransition("manualFan2_3_1", "slide", {}, {{3,1,6,3},{3,1,7,3},{3,1,7,2}})
    newShape("door","door1_3_1", {3, 1, 1, 4}, "left")
    newShape("shape","bar1_3_1", {3, 1, 2, 4}, "bar", {"horz"})
    newShape("shape","triangle1_3_1", {3, 1, 2, 4}, "triangleTopRightShape")
    newTransition("triangle1_3_1", "slide", {}, {{3,1,2,4},{3,1,4,4}})
    newShape("shape","bar2_3_1", {3, 1, 7, 4}, "bar", {"vert", 3})
    newTransition("bar2_3_1", "slide", {}, {{3,1,6,4},{3,1,7,4}})
    newShape("autoFan","autoFan1_3_1", {3, 1, 7, 5}, "up")

    --SWITCHES
    newShape("switch","switch1_2_1", {2, 1, 6, 4}, { {"slide","bar1_2_1"} }, {"one-way"})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 1, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 4}, "purple")
    newShape("gem","purple", {3, 1, 2, 5}, "purple")
    newShape("gem","purple", {3, 1, 4, 5}, "purple")
    newShape("gem","purple", {3, 1, 6, 5}, "purple")
    newShape("gem","purple", {3, 1, 7, 1}, "purple")
    newShape("gem","purple", {3, 1, 7, 4}, "purple")
    newShape("gem","purple", {3, 1, 3, 2}, "purple")
    newShape("gem","purple", {3, 1, 5, 2}, "purple")
    newShape("gem","purple", {3, 1, 4, 5}, "purple")
    newShape("gem","purple", {3, 1, 4, 1}, "purple")
    newShape("gem","purple", {3, 1, 5, 4}, "purple")
    newShape("gem","purple", {3, 1, 7, 4}, "purple")
    newShape("gem","redCoin", {2, 1, 4, 4}, "redCoin")
    newShape("gem","blueCoin", {3, 1, 1, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 1, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 5, 2}, 55)
    newShape("item","coins", {2, 1, 5, 4}, 65)
    newShape("item","coins", {3, 1, 4, 3}, 14)
    newShape("item","small-present", {2, 1, 7, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
