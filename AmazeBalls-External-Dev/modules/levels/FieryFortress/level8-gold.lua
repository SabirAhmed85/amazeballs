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

    -- 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    newShape("shape", "bar1_1_1", {1, 1, 5, 1}, "bar", {"vert"})
    newTransition("bar1_1_1", "slide", {"brown"}, {{1,1,2,1},{1,1,4,1},{1,1,5,1}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 5, 1}, "left")
    newShape("shape", "triangle3_1_1", {1, 1, 6, 1}, "triangleBottomRightShape")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 2}, "up")
    --newShape("timeOut", "timeOut1_1_1", {1, 1, 2, 2, 2})
    newShape("shape", "triangle4_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 5, 2}, "up")
    newShape("item", "mystery-block", {1, 1, 2, 3}, {
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "spitter", properties = {directions = {"right", "down", "left"} } }
    })
    newShape("shape", "triangle5_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    newShape("autoFan", "autoFan4_1_1", {1, 1, 4, 3}, "up")
    --newShape("gem", "purpleCoin", {1, 1, 5, 3}, "purpleCoin")
    newShape("item", "mystery-block", {1, 1, 6, 3}, {
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "spitter", properties = {directions = {"left"} } }
    })
    newShape("simple", "simple1_1_1", {1, 1, 7, 3})
    newTransition("simple1_1_1", "slide", {}, {{1,1,6,2},{1,1,7,3}})
    newShape("shape", "triangle6_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    newTransition("triangle6_1_1", "slide", {}, {{1,1,2,4},{1,1,4,4},{1,1,6,4}})
    newShape("shape", "triangle7_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape")
    newShape("simple", "simple2_1_1", {1, 1, 1, 5})
    newTransition("simple2_1_1", "slide", {}, {{1,1,1,4},{1,1,1,5}})
    newShape("shape", "bar2_1_1", {1, 1, 2, 6}, "bar", {"vert", 4})
    newShape("shape", "bar3_1_1", {1, 1, 4, 6}, "bar", {"vert", 2})
    newShape("shape", "bar4_1_1", {1, 1, 6, 6}, "bar", {"vert", 2})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 7, 5})

    -- 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 2, 1}, "triangleBottomLeftShape")
    newShape("door", "door1_2_1", {2, 1, 1, 2}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 1, 2}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 3, 2}, "right")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,3,1},{2,1,3,2}})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 5, 2}, "down")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,5,2},{2,1,6,2}})
    newShape("shape", "bar1_2_1", {2, 1, 7, 2}, "bar", {"horz", 2})
    newShape("shape", "triangle3_2_1", {2, 1, 7, 2}, "triangleBottomLeftShape")
    newTransition("triangle3_2_1", "slide", {}, {{2,1,7,1},{2,1,7,2}})
    newShape("shape", "bar1_2_1", {2, 1, 6, 3}, "bar", {"horz", 3})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 3, 4}, "up")
    newTransition("autoFan3_2_1", "slide", {}, {{2,1,2,4},{2,1,3,4}})
    newShape("autoFan", "autoFan4_2_1", {2, 1, 5, 4}, "left")
    newTransition("autoFan4_2_1", "slide", {}, {{2,1,5,4},{2,1,5,5}})
    newShape("shape", "triangle4_2_1", {2, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    newShape("shape", "triangle5_2_1", {2, 1, 7, 5}, "triangleTopRightShape")

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 2, 1}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 6, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 6, 5}, "purpleCoin")

    newShape("item", "coins", {1, 1, 5, 3}, 350)
    newShape("item", "coins", {2, 1, 4, 1}, 50)
    newShape("item", "small-present", {2, 1, 1, 3}, {})

    newShape("item", "big-present", {2, 1, 6, 3}, {})

    newShape("item", "coins", {2, 1, 7, 4}, 70)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
