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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 1}, "right")
    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 4, 1})
    newShape("item", "mystery-block", {1, 1, 7, 1}, {
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"down", "right"} } }
    })
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "bar1_1_1", {1, 1, 5, 3}, "bar", {"vert", 4})
    newShape("shape", "triangle3_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, 5})
    newShape("item", "mystery-block", {1, 1, 2, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    })
    newShape("shape", "triangle4_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, 6, "breakable"})

    --SCREEN 2-1
    newShape("spitter", "spitter1_2_1", {2, 1, 4, 1}, {"none", "right", "down", "left"})
    newShape("shape", "triangle1_2_1", {2, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar1_2_1", {2, 1, 4, 3}, "bar", {"horz", 2})
    newShape("shape", "triangle3_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape", {1, 22, "breakable"})
    newShape("shape", "triangle4_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape")
    newTransition("triangle4_2_1", "slide", {}, {{2,1,5,3},{2,1,5,4},{2,1,6,5}})
    newShape("shape", "triangle5_2_1", {2, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "bar2_2_1", {2, 1, 4, 5}, "bar", {"vert"})
    newShape("shape", "triangle6_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("tunnel", "tunnel1_2_1", {2, 1, 4, 5, 3, 1, 4, 4, "none"})
    newShape("shape", "bar3_2_1", {2, 1, 4, 6}, "bar", {"vert"})

    --SCREEN 3-1
    newShape("shape", "triangle1_3_1", {3, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("endPoint", "endPoint1_3_1", {3, 1, 4, 1})
    newShape("shape", "triangle2_3_1", {3, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape", "bar1_3_1", {3, 1, 2, 2}, "bar", {"horz", 3})
    newShape("shape", "bar2_3_1", {3, 1, 3, 2}, "bar", {"horz", 2})
    newShape("simple", "simple1_3_1", {3, 1, 2, 3})
    newTransition("simple1_3_1", "slide", {}, {{3,1,2,2},{3,1,2,3}})
    newShape("shape", "triangle3_3_1", {3, 1, 4, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle4_3_1", {3, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle5_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, 1})
    newShape("autoFan", "autoFan1_3_1", {3, 1, 3, 4}, "down")
    newTransition("autoFan1_3_1", "slide", {}, {{3,1,3,1},{3,1,3,4}})
    newShape("shape", "bar3_3_1", {3, 1, 4, 4}, "bar", {"vert", 3})
    newShape("shape", "bar4_3_1", {3, 1, 5, 4}, "bar", {"vert", 3})
    newShape("shape", "bar5_3_1", {3, 1, 6, 4}, "bar", {"horz", 4})
    newTransition("bar5_3_1", "slide", {}, {{3,1,6,1},{3,1,6,4}})
    newShape("shape", "triangle6_3_1", {3, 1, 7, 4}, "triangleTopLeftShape")

    --SWITCHES

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 4}, "purple")
    newShape("gem", "purple", {3, 1, 2, 4}, "purple")
    newShape("gem", "purple", {3, 1, 1, 2}, "purple")
    newShape("gem", "purple", {3, 1, 5, 1}, "purple")
    newShape("gem", "purple", {3, 1, 7, 3}, "purple")
    newShape("gem", "purple", {3, 1, 6, 1}, "purple")
    newShape("gem", "purple", {3, 1, 4, 2}, "purple")
    newShape("gem", "purple", {3, 1, 6, 3}, "purple")
    newShape("gem", "redCoin", {3, 1, 5, 2}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {3, 1, 2, 1}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 1, 4, 2}, 58)
    newShape("item", "coins", {3, 1, 6, 4}, 65)
    newShape("item", "big-present", {1, 1, 4, 4}, {})
    newShape("item", "small-present", {2, 1, 1, 5}, {})
    newShape("item", "small-present", {3, 1, 1, 3}, {})
    newShape("item", "characterSpecial", {1, 1, 2, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
