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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 2}, "right")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 2}, "up")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 7, 2})
    newShape("shape", "triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1})
    newShape("shape", "triangle3_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, 1})
    newTransition("triangle3_1_1", "slide", {}, {{1,1,3,3},{1,1,4,4}})
    newShape("shape", "triangle4_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1, 2})
    newTransition("triangle4_1_1", "slide", {}, {{1,1,4,1},{1,1,5,3}})
    newShape("autoFan", "autoFan3_1_1", {1, 1, 2, 4}, "up")
    newShape("autoFan", "autoFan4_1_1", {1, 1, 6, 4}, "left")
    newShape("shape", "triangle5_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1})
    newTransition("triangle5_1_1", "slide", {}, {{1,1,7,4},{1,1,7,5}})
    newShape("shape", "triangle6_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1})
    newShape("autoFan", "autoFan5_1_1", {1, 1, 5, 5}, "right")
    newTransition("autoFan5_1_1", "slide", {}, {{1,1,3,5},{1,1,5,5}})
    newShape("door", "door1_1_1", {1, 1, 4, 5}, "down")
    newShape("door", "door2_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    newShape("autoFan", "autoFan1_1_2", {1, 2, 4, 1}, "down")
    newShape("shape", "triangle1_1_2", {1, 2, 5, 1}, "triangleBottomRightShape", {1, 3})
    newShape("door", "door1_1_2", {1, 2, 6, 1}, "up")
    newShape("shape", "triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, 4})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 4, 2}, "down")
    newShape("autoFan", "autoFan3_1_2", {1, 2, 6, 2}, "up")
    newShape("shape", "triangle3_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, 3})
    newShape("simple", "simple1_1_2", {1, 2, 5, 3})
    newTransition("simple1_1_2", "slide", {}, {{1,2,1,2},{1,2,3,3},{1,2,4,3},{1,2,5,3},{1,2,5,4,"*"},{1,2,7,4}})
    newShape("shape", "triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, 5})
    newShape("autoFan", "autoFan4_1_2", {1, 2, 2, 4}, "down")
    newShape("autoFan", "autoFan5_1_2", {1, 2, 4, 4}, "up")
    newShape("shape", "triangle5_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, 1})
    newShape("door", "door2_1_2", {1, 2, 2, 5}, "down")
    newShape("shape", "triangle6_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, 5})
    newShape("autoFan", "autoFan6_1_2", {1, 2, 4, 5}, "up")
    newShape("item", "mystery-block", {1, 2, 7, 5}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right", "none", "left"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    newShape("door", "door3_1_2", {1, 2, 7, 5}, "right")

    -- 2-2
    newShape("shape", "triangle1_2_2", {2, 2, 1, 1}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("shape", "triangle2_2_2", {2, 2, 2, 1}, "triangleBottomRightShape")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 3, 1}, "down")
    newShape("shape", "triangle3_2_2", {2, 2, 5, 1}, "triangleBottomRightShape", {1, 8})
    newShape("shape", "triangle4_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape")
    newShape("shape", "triangle6_2_2", {2, 2, 4, 3}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("characterChangePoint", "characterChangePoint1_2_2", {2, 2, 7, 3})
    newTransition("characterChangePoint1_2_2", "slide", {"purple"}, {{2,2,6,3},{2,2,7,3}})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 1, 4}, "left")
    newTransition("autoFan2_2_2", "slide", {}, {{2,2,1,4},{2,2,1,5}})
    newShape("autoFan", "autoFan3_2_2", {2, 2, 2, 4}, "up")
    newShape("autoFan", "autoFan4_2_2", {2, 2, 4, 4}, "up")
    newTransition("autoFan4_2_2", "slide", {}, {{2,2,4,4},{2,2,4,5}})
    newShape("shape", "triangle7_2_2", {2, 2, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door", "door1_2_2", {2, 2, 1, 5}, "left")
    newShape("autoFan", "autoFan5_2_2", {2, 2, 2, 5}, "right")
    newShape("shape", "bar1_2_2", {2, 2, 5, 5}, "bar", {"horz", 3})
    newShape("autoFan", "autoFan6_2_2", {2, 2, 5, 5}, "up")
    newShape("shape", "triangle8_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, 11})

    --SCREEN 1-3
    newShape("shape", "triangle1_1_3", {1, 3, 1, 1}, "triangleTopLeftShape", {1, 6})
    newShape("autoFan", "autoFan1_1_3", {1, 3, 3, 1}, "down")
    newTransition("autoFan1_1_3", "slide", {}, {{1,3,2,2},{1,3,3,1}})
    newShape("door", "door1_1_3", {1, 3, 4, 1}, "up")
    newShape("shape", "triangle2_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_3", {1, 3, 6, 2}, "triangleBottomLeftShape", {1, 2})
    newShape("autoFan", "autoFan2_1_3", {1, 3, 1, 3}, "down")
    newShape("shape", "triangle4_1_3", {1, 3, 5, 3}, "triangleBottomLeftShape", {1})
    newShape("autoFan", "autoFan3_1_3", {1, 3, 4, 3}, "left")
    newTransition("autoFan3_1_3", "slide", {}, {{1,3,3,3},{1,3,4,3}})
    newShape("shape", "triangle5_1_3", {1, 3, 3, 4}, "triangleTopRightShape", {1})
    newShape("shape", "triangle6_1_3", {1, 3, 4, 4}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle7_1_3", {1, 3, 1, 5}, "triangleTopRightShape", {1})
    newShape("simple", "simple1_1_3", {1, 3, 2, 5})
    newTransition("simple1_1_3", "slide", {}, {{1,3,2,5},{1,3,3,5}})
    newShape("autoFan", "autoFan4_1_3", {1, 3, 5, 5}, "up")
    newTransition("autoFan4_1_3", "slide", {}, {{1,3,5,5},{1,3,6,5},{1,3,7,5}})

    --GEMS
    newShape("gem", "purple", {1, 3, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 3, 2, 4}, "purple")
    newShape("gem", "purple", {1, 3, 6, 4}, "purple")
    newShape("gem", "purple", {1, 3, 7, 3}, "purple")
    newShape("gem", "purple", {1, 3, 4, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 5}, "purple")
    newShape("gem", "purple", {2, 2, 5, 4}, "purple")
    newShape("gem", "purple", {2, 2, 6, 5}, "purple")
    newShape("gem", "purple", {2, 2, 5, 2}, "purple")
    newShape("gem", "redCoin", {1, 2, 5, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 3, 7, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 2, 6, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 3, 1}, 90)
    newShape("item", "coins", {1, 1, 4, 2}, 90)
    newShape("item", "coins", {1, 3, 4, 2}, 90)
    newShape("item", "coins", {2, 2, 7, 1}, 250)
    newShape("item", "small-present", {1, 3, 4, 5}, {})

    newShape("item", "big-present", {2, 2, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t