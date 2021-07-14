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
    newShape("backFire","backFire1_1_1", {1, 1, 7, 1})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,3,1},{1,1,7,1}})
    newShape("endPoint","endPoint1_1_1", {1, 1, 5, 2})
    newShape("autoFan","autoFan1_1_1", {1, 1, 1, 3}, "left")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","blueCoin", {1, 1, 4, 3}, "blueCoin")
    newShape("item","big-present", {1, 1, 6, 3}, {})

    newShape("shape","triangle1_1_1", {1, 1, 3, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 4}, "up")
    newShape("manualFan","manualFan2_1_1", {1, 1, 1, 5}, "down")
    newShape("shape","triangle3_1_1", {1, 1, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 4, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("simple","simple1_1_1", {1, 1, 7, 5})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,2,1},{1,2,4,1}})
    newShape("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door","door1_1_2", {1, 2, 7, 1}, "up")
    newShape("shape","triangle3_1_2", {1, 2, 1, 2}, "triangleTopRightShape")
    newShape("shape","triangle4_1_2", {1, 2, 1, 3}, "triangleBottomRightShape")
    newShape("shape","bar1_1_2", {1, 2, 7, 3}, "bar", {"horz"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 4}, "up")
    newShape("shape","triangle5_1_2", {1, 2, 6, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle6_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 1, 5}, "up")
    newShape("door","door1_1_2", {1, 2, 1, 5}, "down")
    newShape("simple","simple1_1_2", {1, 2, 7, 5})

    --SCREEN 1-3
    newShape("door","door1_1_3", {1, 3, 1, 1}, "up")
    newShape("shape","triangle1_1_3", {1, 3, 2, 1}, "triangleBottomRightShape")
    newShape("shape","triangle1_1_3", {1, 3, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door","door2_1_3", {1, 3, 7, 1}, "up")
    newShape("shape","triangle1_1_3", {1, 3, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_3", {1, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_3", {1, 3, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_3", {1, 3, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan1_1_3", {1, 3, 6, 3}, "down")
    newTransition("autoFan1_1_3", "slide", {}, {{1,3,6,2},{1,3,6,3}})
    newShape("autoFan","autoFan2_1_3", {1, 3, 2, 4}, "right")
    newTransition("autoFan2_1_3", "slide", {}, {{1,3,2,4},{1,3,3,4}})
    newShape("item","map", {1, 3, 6, 4})
    newShape("shape","triangle1_1_3", {1, 3, 7, 4}, "triangleBottomLeftShape", {1, 4})
    newShape("shape","bar1_1_3", {1, 3, 3, 5}, "bar", {"vert", 3})
    newShape("shape","triangle1_1_3", {1, 3, 3, 5}, "triangleTopRightShape")
    newTransition("triangle1_1_3", "slide", {}, {{1,3,3,5},{1,3,4,5}})
    newShape("shape","triangle1_1_3", {1, 3, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 1-4
    newShape("door","door1_1_4", {1, 4, 4, 1}, "up")
    newShape("item","mystery-block", {1, 4, 4, 2}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "triangle", properties = {shape = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up","right","left"} } }
    })
    newShape("simple","simple1_1_1", 1, 4, 2, 4})
    newShape("item","mystery-block", {1, 4, 4, 4}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","right"} } }
    })

    --SWITCHES
    newShape("switch","switch1_2_3", {2, 3, 4, 4}, { {"door-open","door1_2_3"},{"door-open","door3_2_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 4
t.screenHorzTotal = 1
t.screenVertTotal = 4
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
