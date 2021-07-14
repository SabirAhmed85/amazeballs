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
    newShape("endPoint", "endPoint1_1_1", {1, 1, 3, 1})
    newShape("shape", "triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle2_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("simple", "simple1_1_1", {1, 1, 1, 3})
    newShape("shape", "triangle3_1_1", {1, 1, 3, 3}, "triangleBottomRightShape")
    newShape("shape", "triangle4_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 3, 4}, "left")
    newShape("shape", "triangle5_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "fire"})
    newShape("simple", "simple2_1_1", {1, 1, 2, 5})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 5, 5}, "down")
    newShape("door", "door1_1_1", {1, 1, 5, 5}, "down")
    newShape("shape", "triangle6_1_1", {1, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("door", "door2_1_2", {1, 2, 5, 1}, "up")
    newShape("simple", "simple1_1_2", {1, 2, 5, 1})
    newShape("item", "mystery-block", {1, 2, 1, 2}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"up", "left"} } }
    })
    newShape("manualFan", "manualFan1_1_2", {1, 2, 5, 2}, "left")
    newShape("shape", "triangle1_1_2", {1, 2, 2, 3}, "triangleTopRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,5},{1,2,2,3}})
    newShape("shape", "triangle2_1_2", {1, 2, 3, 3}, "triangleTopRightShape")
    newShape("shape", "triangle3_1_2", {1, 2, 5, 3}, "triangleTopLeftShape")
    newShape("manualFan", "manualFan2_1_2", {1, 2, 4, 4}, "down")
    newTransition("manualFan2_1_2", "slide", {}, {{1,2,3,5},{1,2,4,4},{1,2,6,4}})

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 5, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 4, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 7, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 1, 4}, 470)
    newShape("item", "coins", {1, 1, 5, 4}, 70)
    newShape("item", "coins", {1, 2, 6, 5}, 80)
    newShape("item", "fireCape", {1, 2, 7, 2, 3, 5})
    newShape("item", "big-present", {1, 2, 3, 4}, {})
    newShape("item", "small-present", {1, 1, 3, 2}, {})
    newShape("item", "small-present", {1, 1, 4, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
