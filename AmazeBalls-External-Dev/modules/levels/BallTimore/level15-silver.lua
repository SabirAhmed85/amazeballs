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
    newShape("spitter","spitter1_1_1", {1, 1, 7, 2}, {"none","none","down","none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,2,2},{1,1,3,2},{1,1,5,2},{1,1,7,2}})
    newShape("item","mystery-block", {1, 1, 3, 5}, {
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"right","down"} } }
    })
    newShape("item","mystery-block", {1, 1, 5, 5}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    })
    newShape("item","mystery-block", {1, 1, 6, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } }
    })
    newShape("endPoint","endPoint1_1_1", {1, 1, 1, 5})
    newShape("autoFan","autoFan1_1_1", {1, 1, 7, 5}, "up")

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_1", {2, 1, 2, 1}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape","triangle3_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("gem","blueCoin", {2, 1, 6, 1}, "blueCoin")
    newShape("shape","triangle4_2_1", {2, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle5_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle6_2_1", {2, 1, 6, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("shape","triangle7_2_1", {2, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle10_2_1", {2, 1, 1, 4}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape","triangle9_2_1", {2, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 3, 4}, "up")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,3,3},{2,1,3,4}})
    newShape("shape","triangle8_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("autoFan","autoFan2_2_1", {2, 1, 7, 4}, "up")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,7,3},{2,1,7,4}})
    newShape("door","door1_2_1", {2, 1, 1, 5}, "left")
    newShape("shape","triangle11_2_1", {2, 1, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan","autoFan3_2_1", {2, 1, 2, 5}, "down")
    newShape("shape","triangle12_2_1", {2, 1, 3, 5}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("shape","triangle13_2_1", {2, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle14_2_1", {2, 1, 6, 5}, "triangleTopRightShape", {1, _, "breakable"})

    --SCREEN 3-1
    newShape("shape","bar1_3_1", {3, 1, 5, 1}, "bar", {"vert", 4})
    newShape("gem","redCoin", {3, 1, 5, 1}, "redCoin")
    newShape("shape","bar2_3_1", {3, 1, 6, 1}, "bar", {"horz", 4})
    newShape("autoFan","autoFan1_3_1", {3, 1, 2, 2}, "right")
    newTransition("autoFan1_3_1", "slide", {}, {{3,1,2,1},{3,1,2,2}})
    newShape("shape","triangle1_3_1", {3, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_3_1", {3, 1, 6, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("simple","simple2_3_1", {3, 1, 7, 2})
    newShape("door","door1_3_1", {3, 1, 1, 3}, "left")
    newShape("shape","triangle3_3_1", {3, 1, 4, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("shape","triangle4_3_1", {3, 1, 6, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("item","big-present", {3, 1, 1, 4}, {})

    newShape("shape","bar3_3_1", {3, 1, 3, 4}, "bar", {"horz", 2})
    newShape("backFire","backFire1_3_1", {3, 1, 3, 4})
    newTransition("backFire1_3_1", "slide", {}, {{3,1,1,1},{3,1,1,3,"*"},{3,1,3,3,"*"},{3,1,3,4},{3,1,4,4}})
    newShape("shape","bar4_3_1", {3, 1, 5, 4}, "bar", {"horz", 4})
    newShape("gem","purple", {3, 1, 5, 4}, "purple")
    newShape("shape","bar5_3_1", {3, 1, 4, 5}, "bar", {"vert", 4})
    newShape("shape","bar6_3_1", {3, 1, 5, 5}, "bar", {"vert", 4})
    newShape("simple","simple2_3_1", {3, 1, 2, 5})

    --SCREEN 3-2
    newShape("shape","triangle1_3_2", {3, 2, 2, 1}, "triangleTopRightShape", {1, 16, "breakable"})
    newShape("shape","triangle2_3_2", {3, 2, 5, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_3_2", {3, 2, 6, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle4_3_2", {3, 2, 1, 2}, "triangleTopRightShape", {1, _, "fire"})
    newShape("shape","bar1_3_2", {3, 2, 2, 2}, "bar", {"vert", 4})
    newShape("shape","triangle5_3_2", {3, 2, 3, 2}, "triangleBottomLeftShape")
    newShape("shape","triangle6_3_2", {3, 2, 4, 2}, "triangleBottomRightShape")
    newShape("shape","triangle7_3_2", {3, 2, 5, 2}, "triangleTopLeftShape")
    newShape("autoFan","autoFan1_3_2", {3, 2, 1, 3}, "right")
    newShape("autoFan","autoFan2_3_2", {3, 2, 7, 3}, "left")
    newShape("shape","triangle8_3_2", {3, 2, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle9_3_2", {3, 2, 4, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","bar2_3_2", {3, 2, 2, 5}, "bar", {"horz", 4})
    newShape("shape","triangle10_3_2", {3, 2, 2, 5}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("shape","triangle11_3_2", {3, 2, 5, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle12_3_2", {3, 2, 6, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door","door1_3_2", {3, 2, 2, 1}, "up")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 3
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
