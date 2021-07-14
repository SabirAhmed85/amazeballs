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
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 1}, "right")
    newTransition("manualFan1_1_1", "slide", {"silver"}, {{1,1,1,2},{1,1,2,1}})
    newShape("shape", "bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 2})
    newShape("item", "mystery-block", {1, 1, 3, 1}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    })
    newShape("shape", "triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1})
    newTransition("triangle1_1_1", "slide", {}, {{1,1,4,1},{1,1,7,2}})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 4, 2}, "down")
    newTransition("manualFan2_1_1", "slide", {"silver"}, {{1,1,4,2},{1,1,5,3},{1,1,4,4}})
    newShape("item", "mystery-block", {1, 1, 3, 4}, {
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    newShape("shape", "bar2_1_1", {1, 1, 4, 4}, "bar", {"vert", 2})
    newShape("shape", "triangle2_1_1", {1, 1, 6, 4}, "triangleLeftAndRightShape", {2})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,6,4},{1,1,7,4}})
    newShape("door", "door1_1_1", {1, 1, 4, 5}, "down")
    newShape("simple", "simple1_1_1", {1, 1, 1, 5})

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 1, 1}, "up")
    newShape("shape", "bar1_1_2", {1, 2, 2, 1}, "bar", {"vert", 3})
    newShape("simple", "simple1_1_2", {1, 2, 3, 1})
    newTransition("simple1_1_2", "slide", {}, {{1,2,2,1},{1,2,3,1},{1,2,3,2},{1,2,3,3}})
    newShape("characterChangePoint", "characterChangePoint1_1_2", {1, 2, 4, 1})
    newShape("simple", "simple2_1_2", {1, 2, 6, 1})
    newTransition("simple2_1_2", "slide", {}, {{1,2,6,1},{1,2,6,3},{1,2,6,4}})
    newShape("shape", "bar2_1_2", {1, 2, 2, 2}, "bar", {"horz"})
    newShape("item", "map", {1, 2, 2, 2})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 5, 2}, "right")
    newShape("shape", "triangle1_1_2", {1, 2, 1, 3}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("shape", "triangle2_1_2", {1, 2, 4, 3}, "triangleBottomRightShape", {1, 21, "breakable"})
    newShape("shape", "triangle3_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, 7})
    newTransition("triangle3_1_2", "slide", {}, {{1,2,5,3},{1,2,5,5,"*"},{1,2,6,5}})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 7, 3}, "right")
    newShape("shape", "triangle4_1_2", {1, 2, 3, 4}, "triangleTopRightShape", {1, 1})
    newTransition("triangle4_1_2", "slide", {}, {{1,2,1,5},{1,2,2,5},{1,2,3,4}})
    newShape("shape", "bar3_1_2", {1, 2, 6, 5}, "bar", {"vert", 3})
    newShape("door", "door2_1_2", {1, 2, 4, 5}, "down")
    newShape("door", "door3_1_2", {1, 2, 6, 5}, "down")

    --SCREEN 1-3
    newShape("door", "door1_1_3", {1, 3, 6, 1}, "up")
    newShape("shape", "bar1_1_3", {1, 3, 7, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle1_1_3", {1, 3, 6, 2}, "triangleBottomLeftShape", {1, 8, "breakable"})
    newShape("simple", "simple1_1_3", {1, 3, 4, 3})
    newTransition("simple1_1_3", "slide", {}, {{1,3,4,3},{1,3,5,3}})
    newShape("shape", "triangle2_1_3", {1, 3, 6, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan", "manualFan1_1_3", {1, 3, 2, 4}, "right")
    newTransition("manualFan1_1_3", "slide", {"silver"}, {{1,3,2,2},{1,3,1,4},{1,3,2,4}})
    newShape("shape", "triangle3_1_3", {1, 3, 5, 4}, "triangleTopLeftShape", {1})
    newShape("autoFan", "autoFan1_1_3", {1, 3, 7, 4}, "up")
    newShape("shape", "triangle4_1_3", {1, 3, 3, 5}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle4_1_3", "slide", {}, {{1,3,2,5},{1,3,3,5},{1,3,4,5}})
    newShape("endPoint", "endPoint1_1_3", {1, 3, 7, 5})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 3, 4, 1}, "purple")
    newShape("gem", "purple", {1, 3, 4, 4}, "purple")
    newShape("gem", "purple", {1, 3, 5, 2}, "purple")
    newShape("gem", "purple", {1, 3, 5, 5}, "purple")
    newShape("gem", "purple", {1, 3, 7, 3}, "purple")
    newShape("gem", "purple", {1, 3, 1, 3}, "purple")
    newShape("gem", "purple", {1, 3, 6, 4}, "purple")
    newShape("gem", "redCoin", {1, 2, 4, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 1, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 3, 1, 5}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 2, 4}, 70)
    newShape("item", "coins", {1, 3, 7, 1}, 34)
    newShape("item", "bomb", {1, 3, 4, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3})
    newShape("item", "clock", {1, 2, 1, 4, "clock1_1_1", 10, 1})
    newShape("item", "big-present", {1, 1, 3, 2}, {})
    newShape("item", "big-present", {1, 3, 3, 3}, {})
    newShape("item", "small-present", {1, 3, 6, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
