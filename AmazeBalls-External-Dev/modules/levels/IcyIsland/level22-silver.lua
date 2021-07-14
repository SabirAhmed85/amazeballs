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
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape", "triangle3_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape")
    newTransition("triangle3_1_1", "flip-vertical")
    newShape("shape", "triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    newTransition("triangle4_1_1", "flip-horizontal")
    newShape("shape", "triangle5_1_1", {1, 1, 2, 5}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("door", "door1_1_1", {1, 1, 2, 5}, "down")

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 3, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle2_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape")
    newTransition("triangle2_1_2", "flip-horizontal")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 2, 4}, "right")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 6, 4}, "up")
    newShape("shape", "triangle3_1_2", {1, 2, 3, 5}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle3_1_2", "flip-vertical")
    newShape("door", "door1_1_2", {1, 2, 3, 5}, "down")
    newShape("shape", "triangle4_1_2", {1, 2, 7, 5}, "triangleBottomRightShape")
    newTransition("triangle4_1_2", "flip-horizontal")

    --SCREEN 1-3
    newShape("item", "mystery-block", {1, 3, 3, 2}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"right", "down"} } },
        {name = "spitter", properties = {directions = {"right", "down", "left"} } }
    })
    newShape("shape", "triangle1_1_3", {1, 3, 5, 2}, "triangleBottomLeftShape")
    newShape("item", "mystery-block", {1, 3, 7, 2}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "triangle", properties = {shape = {"triangleBottomRightShape"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"left", "down"} } }
    })
    newShape("shape", "bar1_1_3", {1, 3, 4, 3}, "bar", {"vert", 3})
    newShape("simple", "simple1_1_3", {1, 3, 4, 4})
    newTransition("simple1_1_3", "slide", {}, {{1,3,4,4},{1,3,6,4},{1,3,7,4}})
    newShape("simple", "simple2_1_3", {1, 3, 3, 5})
    newShape("endPoint", "endPoint1_1_3", {1, 3, 5, 5})
    newShape("shape", "triangle1_1_3", {1, 3, 6, 5}, "triangleTopRightShape")

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 3, 3, 1}, "purple")
    newShape("gem", "purple", {1, 3, 3, 3}, "purple")
    newShape("gem", "purple", {1, 3, 2, 2}, "purple")
    newShape("gem", "purple", {1, 3, 4, 1}, "purple")
    newShape("gem", "purple", {1, 3, 1, 3}, "purple")
    newShape("gem", "purple", {1, 3, 5, 3}, "purple")
    newShape("gem", "purple", {1, 3, 6, 3}, "purple")
    newShape("gem", "purple", {1, 3, 7, 3}, "purple")
    newShape("gem", "purple", {1, 3, 4, 3}, "purple")
    newShape("gem", "redCoin", {1, 3, 7, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 7, 4}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 4, 5}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 2, 1, 5}, 135)
    newShape("item", "coins", {1, 3, 6, 1}, 26)
    newShape("item", "big-present", {1, 3, 6, 2}, {})
    newShape("item", "small-present", {1, 2, 2, 1}, {})
    newShape("item", "small-present", {1, 3, 5, 1}, {})
    newShape("item", "dummyBall", {1, 1, 7, 2}, {})
    newShape("item", "hook", {1, 3, 1, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
