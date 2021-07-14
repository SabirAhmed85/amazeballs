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

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape")
    newShape("endPoint", "endPoint1_2_1", {2, 1, 3, 1})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 1}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 4, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("backFire", "backFire1_2_1", {2, 1, 7, 2})
    newTransition("backFire1_2_1", "slide", {"lightDarkBlue"}, {{2,1,7,1},{2,1,7,2}})
    newShape("shape", "triangle3_2_1", {2, 1, 1, 3}, "triangleTopRightShape")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 3, 3}, "right")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 6, 3}, "left")
    newShape("shape", "bar1_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,1},{1,2,1,3}})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 5, 1}, "right")
    newTransition("manualFan1_1_2", "slide", {"silver"}, {{1,2,5,1},{1,2,6,1}})
    newShape("door", "door1_1_2", {1, 2, 7, 1}, "right")
    newShape("shape", "triangle2_1_2", {1, 2, 2, 2}, "triangleBottomRightShape")
    newTransition("triangle2_1_2", "slide", {}, {{1,2,2,2},{1,2,3,2}})
    newShape("shape", "triangle3_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle3_1_2", "slide", {}, {{1,2,4,2},{1,2,5,2}})
    newShape("manualFan", "manualFan2_1_2", {1, 2, 4, 3}, "right")
    newShape("door", "door2_1_2", {1, 2, 7, 3}, "right")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 4}, "right")
    newShape("simple", "simple1_1_2", {1, 2, 2, 4})
    newTransition("simple1_1_2", "slide", {}, {{1,2,2,4},{1,2,2,5}})
    newShape("shape", "triangle4_1_2", {1, 2, 6, 4}, "triangleTopAndBottomShape", {1})
    newShape("shape", "triangle5_1_2", {1, 2, 3, 5}, "triangleTopLeftShape")
    newTransition("triangle5_1_2", "slide", {}, {{1,2,3,4},{1,2,3,5}})
    newShape("door", "door3_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    newShape("door", "door1_2_2", {2, 2, 1, 1}, "left")
    newShape("door", "door2_2_2", {2, 2, 3, 1}, "up")
    newShape("simple", "simple1_2_2", {2, 2, 3, 1})
    newShape("shape", "bar1_2_2", {2, 2, 5, 1}, "bar", {"horz"})
    newShape("door", "door3_2_2", {2, 2, 6, 1}, "up")
    newShape("shape", "triangle1_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("manualFan", "manualFan1_2_2", {2, 2, 5, 2}, "up")
    newTransition("manualFan1_2_2", "slide", {"silver"}, {{2,2,3,5},{2,2,5,3},{2,2,5,2}})
    newShape("door", "door4_2_2", {2, 2, 1, 3}, "left")
    newShape("shape", "bar2_2_2", {2, 2, 5, 3}, "bar", {"horz"})
    newShape("shape", "triangle2_2_2", {2, 2, 6, 3}, "triangleBottomRightShape")
    newShape("shape", "triangle3_2_2", {2, 2, 3, 4}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("door", "door5_2_2", {2, 2, 1, 5}, "left")
    newShape("item", "mystery-block", {2, 2, 6, 5}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"up", "left"} } },
        {name = "spitter", properties = {directions = {"up", "left", "down"} } }
    })
    newShape("shape", "bar3_2_2", {2, 2, 7, 5}, "bar", {"horz"})

    --GEMS
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 2, 4, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 3}, "purple")
    newShape("gem", "purple", {2, 2, 4, 3}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {2, 2, 2, 5}, "purple")
    newShape("gem", "purple", {2, 2, 6, 4}, "purple")
    newShape("gem", "redCoin", {2, 2, 5, 1}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 5, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 2, 3, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 1, 5}, 115)
    newShape("item", "coins", {2, 2, 2, 4}, 26)
    newShape("item", "coins", {2, 1, 5, 3}, 130)
    newShape("item", "coins", {2, 1, 3, 2, 45})
    newShape("item", "fireCape", {2, 1, 1, 2, 1, 3 })
    newShape("item", "clock", {1, 2, 1, 4, "clock1_1_1", 10, 1})
    newShape("item", "big-present", {2, 1, 2, 2}, {})
    newShape("item", "small-present", {2, 2, 6, 2}, {})
    newShape("item", "small-present", {1, 2, 2, 1}, {})
    newShape("item", "small-present", {2, 1, 2, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
