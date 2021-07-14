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
    newShape("gun","gun1_1_1", {1, 1, 2, 2}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("autoFan","autoFan1_1_1", {1, 1, 1, 3}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape")
    newShape("item","map", {1, 1, 1, 4})
    newShape("backFire","backFire1_2_1", {1, 1, 2, 4})
    newShape("shape","triangle3_1_1", {1, 1, 5, 4}, "triangleTopLeftShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,4,4},{1,1,5,4},{1,1,5,2}})
    newShape("spitter","spitter1_1_1", {1, 1, 7, 5}, {"none","right","none","none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,7,2},{1,1,7,4},{1,1,7,5}})
    newShape("door","door2_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("simple","simple1_2_1", {2, 1, 1, 2})
    newShape("autoFan","autoFan1_2_1", {2, 1, 5, 2}, "down")
    newShape("shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape")
    newShape("endPoint","endPoint1_2_1", {2, 1, 1, 4})
    newShape("item","mystery-block", {2, 1, 5, 4}, {
        {name = "triangle", properties = {directions = {"triangleTopLeftShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomRightShape"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"right", "left"} } },
        {name = "spitter", properties = {directions = {"left"} } }
    })
    newShape("gun","gun1_2_1", {2, 1, 3, 5}, "up")

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
