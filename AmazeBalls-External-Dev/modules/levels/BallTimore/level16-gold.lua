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
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 1}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 4, 2})
    newShape("shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","triangle1_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","bar1_1_1", {1, 1, 6, 4}, "bar", {"horz", 2})
    newShape("gun","gun1_1_1", {1, 1, 3, 5}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 1, 1}, "down")
    newShape("manualFan","manualFan2_2_1", {2, 1, 6, 1}, "left")
    newShape("item","map", {2, 1, 2, 2})
    newShape("simple","simple1_2_1", {2, 1, 5, 2})
    newShape("shape","triangle1_2_1", {2, 1, 6, 2}, "triangleTopLeftShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,6,2},{2,1,7,2}})
    newShape("door","door2_2_1", {2, 1, 1, 3}, "left")
    newShape("manualFan","manualFan3_2_1", {2, 1, 1, 3}, "down")
    newShape("manualFan","manualFan4_2_1", {2, 1, 4, 3}, "left")
    newShape("simple","simple2_2_1", {2, 1, 7, 3})
    newShape("door","door3_2_1", {2, 1, 1, 4}, "left")
    newShape("manualFan","manualFan5_2_1", {2, 1, 1, 4}, "down")
    newShape("manualFan","manualFan6_2_1", {2, 1, 3, 4}, "left")
    newShape("spitter","spitter2_2_1", {2, 1, 1, 5}, {"none","right","none","none"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 5}, "up")
    newTransition("autoFan1_2_1", "autoSlide", {timePerSlide=600}, {{2,1,2,5},{2,1,6,5}})
    newShape("autoFan","autoFan2_2_1", {2, 1, 7, 5}, "left")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
