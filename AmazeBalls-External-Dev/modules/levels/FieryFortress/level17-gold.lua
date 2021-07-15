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

    -- 2-1
    newShape("shape", "bar1_2_1", {2, 1, 2, 1}, "bar", {"horz", 2})
    newShape("shape", "bar2_2_1", {2, 1, 2, 2}, "bar", {"vert", 2})
    newShape("shape", "triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("shape", "bar3_2_1", {2, 1, 4, 1}, "bar", {"vert"})
    newShape("shape", "bar4_2_1", {2, 1, 5, 1}, "bar", {"vert"})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 1}, "right")
    newShape("autoFan", "autoFan2_2_1", {2, 1, 7, 1}, "down")
    newShape("shape", "triangle2_2_1", {2, 1, 2, 2}, "triangleBottomRightShape")
    newShape("shape", "bar5_2_1", {2, 1, 6, 2}, "bar", {"vert", 4})
    newTransition("bar5_2_1", "slide", {}, {{2,1,6,2},{2,1,7,2}})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 6, 2}, "up")
    newShape("shape", "bar6_2_1", {2, 1, 7, 2}, "bar", {"horz", 4})
    newTransition("bar6_2_1", "slide", {}, {{2,1,7,1},{2,1,7,2}})
    newShape("shape", "triangle3_2_1", {2, 1, 1, 3}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape", "triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape")
    newShape("shape", "triangle5_2_1", {2, 1, 7, 3}, "triangleTopLeftShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,7,3},{2,1,7,5}})
    newShape("shape", "triangle6_2_1", {2, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("simple", "simple1_2_1", {2, 1, 3, 4})
    newTransition("simple1_2_1", "slide", {}, {{2,1,3,5},{2,1,3,4},{2,1,4,4},{2,1,5,3}})
    newShape("shape", "triangle7_2_1", {2, 1, 6, 4}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan4_2_1", {2, 1, 1, 5}, "up")
    newShape("door", "door1_2_1", {2, 1, 4, 5}, "down")
    newShape("door", "door2_2_1", {2, 1, 5, 5}, "down")
    newShape("autoFan", "autoFan5_2_1", {2, 1, 6, 5}, "up")
    newTransition("autoFan5_2_1", "slide", {}, {{2,1,5,5},{2,1,6,5}})

    -- 2-2
    newShape("backFire", "backFire1_2_2", {2, 2, 1, 1})
    newShape("shape", "triangle1_2_2", {2, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_2", {2, 2, 6, 1}, "up")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 1}, "up")
    newShape("shape", "bar1_2_2", {2, 2, 3, 2}, "bar", {"vert", 4})
    newTransition("bar1_2_2", "switchSlide", {}, {{2,2,3,2},{2,2,5,2}})
    newShape("shape", "triangle2_2_2", {2, 2, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    newTransition("bar2_2_2", "switchSlide", {}, {{2,2,6,1},{2,2,6,2}})
    newShape("endPoint", "endPoint1_2_2", {2, 2, 7, 2})
    newShape("shape", "bar3_2_2", {2, 2, 1, 3}, "bar", {"horz", 2})
    newShape("shape", "triangle3_2_2", {2, 2, 1, 3}, "triangleTopRightShape")
    newTransition("triangle3_2_2", "slide", {}, {{2,2,1,3},{2,2,2,3}})
    newShape("shape", "triangle4_2_2", {2, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 4, 3}, "right")
    newTransition("autoFan2_2_2", "switchSlide", {}, {{2,2,4,2},{2,2,4,3}})
    newShape("autoFan", "autoFan3_2_2", {2, 2, 5, 3}, "right")
    newTransition("autoFan3_2_2", "switchSlide", {}, {{2,2,5,2},{2,2,5,3}})
    newShape("item", "map", {2, 2, 1, 4})
    newShape("shape", "triangle5_2_2", {2, 2, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_2_2", {2, 2, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("simple", "simple1_2_2", {2, 2, 7, 4})
    newShape("shape", "bar4_2_2", {2, 2, 4, 5}, "bar", {"horz", 3})
    newTransition("bar4_2_2", "switchSlide", {}, {{2,2,4,4},{2,2,4,5}})
    newShape("shape", "triangle7_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("item", "compass", {2, 2, 6, 5})
    newShape("backFire", "backFire2_2_2", {2, 2, 7, 5})

    -- 1-3
    newShape("autoFan", "autoFan1_1_3", {1, 3, 1, 1}, "down")
    newShape("shape", "triangle1_1_3", {1, 3, 5, 1}, "triangleTopLeftShape")
    newShape("shape", "triangle2_1_3", {1, 3, 6, 1}, "triangleBottomRightShape")
    newShape("autoFan", "autoFan2_1_3", {1, 3, 7, 1}, "right")
    newShape("autoFan", "autoFan3_1_3", {1, 3, 2, 2}, "down")
    newShape("shape", "triangle3_1_3", {1, 3, 3, 2}, "triangleBottomRightShape")
    newShape("autoFan", "autoFan4_1_3", {1, 3, 4, 2}, "down")
    newShape("shape", "triangle4_1_3", {1, 3, 6, 2}, "triangleTopRightShape")
    newShape("shape", "triangle5_1_3", {1, 3, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan5_1_3", {1, 3, 3, 3}, "up")
    newShape("backFire", "backFire1_1_3", {1, 3, 5, 3})
    newTransition("backFire1_1_3", "slide", {}, {{1,3,5,3},{1,3,6,3}})
    newShape("shape", "triangle6_1_3", {1, 3, 7, 3}, "triangleBottomLeftShape")
    newTransition("triangle6_1_3", "slide", {}, {{1,3,7,3},{1,3,7,4}})
    newShape("shape", "triangle7_1_3", {1, 3, 2, 4}, "triangleTopRightShape")
    newTransition("triangle7_1_3", "slide", {}, {{1,3,2,4},{1,3,4,4},{1,3,6,4}})
    newShape("shape", "bar1_1_3", {1, 3, 3, 4}, "bar", {"vert"})
    newShape("shape", "bar2_1_3", {1, 3, 2, 5}, "bar", {"horz", 3})
    newShape("item", "mystery-block", {1, 3, 3, 5}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "triangle", properties = {shape = "triangleTopRightShape" } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape" } }
    })
    newShape("item", "mystery-block", {1, 3, 5, 5}, {
        --{name = "simple"},
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"left", "right"} } }
    })
    newShape("shape", "bar3_1_3", {1, 3, 6, 5}, "bar", {"vert", 4})
    newShape("shape", "bar4_1_3", {1, 3, 2, 6}, "bar", {"vert", 2})
    newShape("shape", "bar5_1_3", {1, 3, 3, 6}, "bar", {"vert", 2})
    newShape("shape", "bar6_1_3", {1, 3, 4, 6}, "bar", {"vert", 2})
    newShape("shape", "bar7_1_3", {1, 3, 5, 6}, "bar", {"vert", 2})
    newShape("shape", "triangle8_1_3", {1, 3, 7, 5}, "triangleTopRightShape")
    newShape("door", "door1_1_3", {1, 3, 7, 5}, "right")

    -- 2-3
    newShape("door", "door1_2_3", {2, 3, 1, 1}, "up")
    newShape("autoFan", "autoFan1_2_3", {2, 3, 1, 1}, "up")
    newShape("shape", "triangle1_2_3", {2, 3, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_3", {2, 3, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_2_3", {2, 3, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "bar1_2_3", {2, 3, 7, 1}, "bar", {"horz"})
    newShape("door", "door2_2_3", {2, 3, 1, 2}, "left")
    newShape("shape", "triangle4_2_3", {2, 3, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_2_3", {2, 3, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle6_2_3", {2, 3, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan2_2_3", {2, 3, 1, 4}, "up")
    newShape("shape", "triangle7_2_3", {2, 3, 4, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("shape", "bar2_2_3", {2, 3, 5, 4}, "bar", {"vert", 2})
    newShape("shape", "triangle8_2_3", {2, 3, 7, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle9_2_3", {2, 3, 3, 5}, "triangleTopLeftShape")
    newShape("autoFan", "autoFan3_2_3", {2, 3, 6, 5}, "right")

    --ALL SWITCHES
    newShape("switch", "switch1_2_1", {2, 1, 2, 1}, { {"slide", "autoFan2_2_2"} })
    newShape("switch", "switch2_2_1", {2, 1, 6, 3}, { {"slide", "autoFan3_2_2"},{"slide", "bar4_2_2"},{"slide", "bar1_2_2"} })

    --GEMS
    newShape("gem", "purple", {1, 3, 4, 3}, "purple")
    newShape("gem", "purple", {1, 3, 2, 3}, "purple")
    newShape("gem", "purple", {1, 3, 5, 2}, "purple")
    newShape("gem", "purple", {1, 3, 2, 5}, "purple")
    newShape("gem", "purple", {1, 3, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "purple", {2, 3, 3, 3}, "purple")
    newShape("gem", "purple", {2, 3, 7, 3}, "purple")
    newShape("gem", "purple", {2, 3, 4, 2}, "purple")
    newShape("gem", "purple", {2, 3, 5, 2}, "purple")
    newShape("gem", "purple", {2, 3, 6, 4}, "purple")
    newShape("gem", "purple", {2, 3, 7, 5}, "purple")
    newShape("gem", "purple", {2, 3, 2, 5}, "purple")
    newShape("gem", "purple", {2, 3, 2, 2}, "purple")
    newShape("gem", "purple", {2, 3, 1, 3}, "purple")
    newShape("gem", "purple", {2, 2, 1, 5}, "purple")
    newShape("gem", "purple", {2, 2, 4, 4}, "purple")
    newShape("gem", "purple", {2, 2, 4, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "redCoin", {2, 3, 2, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 3, 6, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 2, 5}, "purpleCoin")

    --ITEMS
    --newShape("item", "coins", {2, 2, 5, 1}, 250)
    --newShape("item", "coins", {2, 1, 7, 2}, 150)
    --newShape("item", "coins", {2, 3, 7, 1}, 90)
    --newShape("item", "coins", {1, 3, 1, 4}, 90)
    --newShape("item", "coins", {2, 3, 1, 5}, 60)
    --newShape("item", "coins", {2, 3, 3, 4}, 150)
    newShape("item", "small-present", {1, 3, 1, 5}, {})

    newShape("item", "big-present", {2, 1, 3, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
