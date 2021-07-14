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
    newShape("gun","gun1_1_1", {1, 1, 2, 1}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_1_1", "switchSlide", {}, {{1,1,6,1},{1,1,6,2}})
    newShape("endPoint","endPoint1_1_1", {1, 1, 3, 3})
    newShape("shape","triangle2_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    newShape("backFire","backFire1_1_1", {1, 1, 4, 5})
    newShape("item","map", {1, 1, 5, 5})
    newShape("manualFan","manualFan1_1_1", {1, 1, 7, 5}, "left")
    newShape("door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 1-2
    newShape("shape","triangle1_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle2_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape","triangle3_2_1", {2, 1, 3, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("gun","gun1_2_1", {2, 1, 2, 4}, "right")
    newShape("autoFan","autoFan1_2_1", {2, 1, 5, 4}, "up")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,5,2},{2,1,5,4}})
    newShape("simple","simple1_2_1", {2, 1, 1, 5})
    newShape("autoFan","autoFan2_2_1", {2, 1, 3, 5}, "up")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,3,5},{2,1,6,5}})

    --SWITCHES
    newShape("switch","switch1_2_1", {2, 1, 6, 3}, { {"slide","triangle1_1_1"},{"slide","autoFan1_2_1"} }, {"one-way"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
