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
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("gun","gun1_1_1", {1, 1, 1, 3}, "right")
    newShape("item","mystery-block", {1, 1, 4, 3}, {
        {name = "triangle", properties = {directions = {"triangleBottomLeftShape"} } },
        {name = "triangle", properties = {directions = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    })
    newShape("shape","triangle2_1_1", {1, 1, 5, 4}, "triangleTopLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,5,4},{1,1,7,5}})
    newShape("simple","simple1_1_1", {1, 1, 3, 5})

    --SCREEN 2-1
    newShape("spitter","spitter1_2_1", {2, 1, 3, 1}, {"none","none","down","none"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 3}, "right")
    newTransition("autoFan1_2_1", "autoSlide", {timePerSquare=480}, {{2,1,2,3},{2,1,5,3}})
    newShape("shape","bar1_2_1", {2, 1, 3, 4}, "bar", {"vert", 2})
    newShape("shape","triangle1_2_1", {2, 1, 7, 4}, "triangleBottomLeftShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,7,3},{2,1,7,4}})
    newShape("endPoint","endPoint1_2_1", {2, 1, 3, 5})
    newShape("shape","triangle2_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")

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
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
