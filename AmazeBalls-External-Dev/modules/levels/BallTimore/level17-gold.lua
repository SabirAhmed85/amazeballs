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
    newShape("item","mystery-block", {1, 1, 4, 3}, {
        {name = "triangle", properties = {directions = {"triangleBottomRightShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    })
    newShape("item","mystery-block", {1, 1, 7, 3}, {
        {name = "triangle", properties = {directions = {"triangleTopLeftShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    })
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door1_1_2", {1, 2, 4, 1}, "up")
    newShape("shape","triangle2_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape")
    newTransition("triangle2_1_2", "switchSlide", {}, {{1,2,3,2},{1,2,3,3}})
    newShape("shape","triangle3_1_2", {1, 2, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("gun","gun1_1_2", {1, 2, 7, 2}, "left")
    newShape("backFire","backFire1_1_2", {1, 2, 6, 3})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,6,3},{1,2,7,3}})
    newShape("gun","gun2_1_2", {1, 2, 1, 4}, "right")
    newShape("shape","triangle4_1_2", {1, 2, 3, 4}, "triangleTopLeftShape")
    newShape("door","door2_1_2", {1, 2, 4, 5}, "down")
    newShape("shape","triangle5_1_2", {1, 2, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door","door3_1_2", {1, 2, 6, 5}, "down")

    --SCREEN 1-3
    newShape("door","door1_1_3", {1, 3, 2, 1}, "up")
    newShape("door","door2_1_3", {1, 3, 4, 1}, "up")
    newShape("door","door3_1_3", {1, 3, 7, 1}, "up")
    newShape("item","map", {1, 3, 3, 2})
    newShape("simple","simple1_1_3", {1, 3, 4, 3})
    newTransition("simple1_1_3", "switchSlide", {}, {{1,3,2,3},{1,3,3,3},{1,3,4,3}})
    newShape("shape","triangle1_1_3", {1, 3, 5, 3}, "triangleBottomRightShape")
    newShape("shape","triangle2_1_3", {1, 3, 6, 3}, "triangleTopLeftShape", {1, 3})
    newShape("shape","triangle3_1_3", {1, 3, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan1_1_3", {1, 3, 7, 5}, "up")

    --SWITCHES    
    newShape("switch","switch1_1_1", {1, 1, 7, 5}, { {"slide","triangle2_1_2"} }, {"one-way"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
