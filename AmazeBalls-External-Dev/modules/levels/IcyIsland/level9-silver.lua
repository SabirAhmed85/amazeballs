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
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 1}, "down")
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left")
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,6,3},{1,1,6,2},{1,1,7,1}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 4, 3}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 3}, "right")
    newShape("autoFan","autoFan3_1_1", {1, 1, 6, 4}, "right")
    newShape("door","door2_1_1", {1, 1, 7, 4}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, 1})
    newShape("autoFan","autoFan4_1_1", {1, 1, 5, 5}, "up")
    newTransition("autoFan4_1_1", "slide", {}, {{1,1,5,3},{1,1,5,5}})
    newShape("door","door3_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("autoFan","autoFan1_2_1", {2, 1, 7, 1}, "left")
    newShape("door","door2_2_1", {2, 1, 1, 2}, "left")
    newShape("characterChangePoint","characterChangePoint1_2_1", {2, 1, 1, 2})
    newShape("manualFan","manualFan1_2_1", {2, 1, 3, 2}, "left")
    newShape("door","door3_2_1", {2, 1, 1, 3}, "left")
    newShape("autoFan","autoFan2_2_1", {2, 1, 4, 3}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 6, 3}, "triangleBottomRightShape", {1, 8})
    newShape("door","door4_2_1", {2, 1, 7, 3}, "right")
    newShape("shape","triangle2_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,4},{2,1,4,4},{2,1,5,4}})
    newShape("manualFan","manualFan2_2_1", {2, 1, 6, 5}, "up")
    newShape("shape","triangle3_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")

    --SCREEN 3-1
    newShape("shape","triangle1_3_1", {3, 1, 1, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape")
    newShape("spitter","spitter1_3_1", {3, 1, 1, 3, "up","none","none","none"})
    newShape("endPoint","endPoint1_3_1", {3, 1, 6, 3})
    newShape("autoFan","autoFan1_3_1", {3, 1, 5, 5}, "right")
    newTransition("autoFan1_3_1", "autoSlide", {timePerSquare = 480, pauseTime = 0}, {{3,1,5,3},{3,1,5,5}})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 5, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {2, 1, 6, 2}, "purple")
    newShape("gem","purple", {2, 1, 7, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 5}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {3, 1, 2, 4}, "purple")
    newShape("gem","purple", {3, 1, 4, 4}, "purple")
    newShape("gem","purple", {3, 1, 6, 4}, "purple")
    newShape("gem","purple", {3, 1, 1, 2}, "purple")
    newShape("gem","purple", {3, 1, 2, 1}, "purple")
    newShape("gem","purple", {3, 1, 4, 1}, "purple")
    newShape("gem","purple", {3, 1, 5, 2}, "purple")
    newShape("gem","purple", {3, 1, 1, 5}, "purple")
    newShape("gem","purple", {3, 1, 3, 5}, "purple")
    newShape("gem","redCoin", {3, 1, 7, 5}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 6, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 2, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 1, 2}, 135)
    newShape("item","coins", {3, 1, 3, 4}, 33)
    newShape("item","big-present", {3, 1, 7, 3}, {})
    newShape("item","big-present", {3, 1, 3, 1}, {})
    newShape("item","small-present", {2, 1, 5, 2}, {})
    newShape("item","bomb", {1, 1, 5, 2}, {})
    newShape("item","fireCape", {2, 1, 1, 5}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
