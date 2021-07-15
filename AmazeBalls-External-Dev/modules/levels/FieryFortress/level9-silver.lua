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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,3,1},{1,1,4,1}})
    newShape("shape", "bar1_1_1", {1, 1, 5, 1}, "bar", {"horz", 3})
    newShape("item", "mystery-block", {1, 1, 5, 1}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "bar", properties = { shape = "horz"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } }
    })
    newShape("shape", "triangle3_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "triangle4_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape", {1})
    newTransition("triangle3_1_1", "slide", {}, {{1,1,2,3},{1,1,3,3}})
    newShape("shape", "bar2_1_1", {1, 1, 5, 3}, "bar", {"vert", 2})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 5, 3})
    newShape("item", "map", {1, 1, 6, 3})
    newShape("item", "mystery-block", {1, 1, 7, 3}, {
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    newShape("door", "door1_1_1", {1, 1, 1, 5}, "down")
    newShape("shape", "triangle5_1_1", {1, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("simple", "simple1_1_2", {1, 2, 7, 2})
    newTransition("simple1_1_2", "slide", {}, {{1,2,2,2},{1,2,4,2},{1,2,6,2},{1,2,7,2}})
    newShape("shape", "triangle1_1_2", {1, 2, 2, 3}, "triangleLeftAndRightShape", {1})
    newShape("gem", "purple1_1_2", {1, 2, 1, 4}, "purple")
    newShape("simple", "simple2_1_2", {1, 2, 3, 4})
    newTransition("simple2_1_2", "slide", {}, {{1,2,3,4},{1,2,5,4}})
    newShape("shape", "triangle2_1_2", {1, 2, 6, 3}, "triangleLeftAndRightShape", {2})
    newShape("door", "door2_1_2", {1, 2, 4, 5}, "down")
    newShape("door", "door3_1_2", {1, 2, 1, 5}, "down")

    --SCREEN 1-3
    newShape("autoFan", "autoFan1_1_3", {1, 3, 1, 1}, "right")
    newTransition("autoFan1_1_3", "slide", {}, {{1,3,1,1},{1,3,1,2}})
    newShape("door", "door1_1_3", {1, 3, 5, 1}, "up")
    newShape("gem", "purple2_1_3", {1, 3, 1, 3}, "purple")
    newShape("shape", "triangle2_1_3", {1, 3, 4, 3}, "triangleTopLeftShape", {1})
    newTransition("triangle2_1_3", "slide", {}, {{1,3,4,2},{1,3,4,3},{1,3,4,5}})
    newShape("shape", "triangle3_1_3", {1, 3, 7, 3}, "triangleTopRightShape", {1})
    newShape("autoFan", "autoFan2_1_3", {1, 3, 5, 5}, "up")

    --GEMS
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 3, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 3, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 3, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 3, 5, 2}, "purple")
    newShape("gem", "purple", {1, 3, 5, 4}, "purple")
    newShape("gem", "purple", {1, 3, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 3, 3, 3}, "purple")
    newShape("gem", "redCoin", {1, 2, 6, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 3, 3, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 5, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 3, 7, 2}, 80)
    newShape("item", "coins", {1, 1, 7, 2}, 40)
    newShape("item", "small-present", {1, 2, 7, 1}, {})

    newShape("item", "big-present", {1, 1, 6, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t