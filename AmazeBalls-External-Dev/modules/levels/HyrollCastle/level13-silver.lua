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
    newShape("simple","simple1_1_1", {1, 1, 4, 2})
    newTransition("simple1_1_1", "slide", {}, {{1,1,4,2},{1,1,5,2}})
    newShape("shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("item","mystery-block", {1, 1, 3, 2}, {
        {name = "triangle", properties = {directions = {"triangleBottomRightShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    newShape("shape","triangle2_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, 1})
    newTransition("triangle2_1_1", "flip-vertical")
    newShape("shape","triangle3_1_1", {1, 1, 5, 3}, "triangleTopLeftShape", {1, 5})
    newTransition("triangle3_1_1", "flip-vertical")
    --newShape("gem","blueCoin", {1, 1, 7, 4}, "blueCoin")
    newShape("autoFan","autoFan1_1_1", {1, 1, 3, 5}, "up")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,3,4},{1,1,3,5}})
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")
    newShape("door","door2_1_1", {1, 1, 5, 5}, "down")
    newShape("door","door3_1_1", {1, 1, 6, 5}, "down")
    newShape("shape","bar1_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 4, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 5, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 5, 1}, "triangleTopRightShape")
    newShape("door","door3_1_2", {1, 2, 6, 1}, "up")
    newShape("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    newShape("backFire","backFire1_1_2", {1, 2, 2, 2})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,2,2},{1,2,3,3},{1,2,3,4}})
    newShape("shape","bar1_1_2", {1, 2, 5, 2}, "bar", {"horz", 2})
    newShape("endPoint","endPoint1_1_2", {1, 2, 5, 2})
    newShape("shape","triangle3_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, 8})
    newShape("simple","simple1_1_2", {1, 2, 5, 3})
    newShape("shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape")
    newShape("shape","triangle5_1_2", {1, 2, 2, 4}, "triangleBottomRightShape", {1, 3})
    newShape("shape","triangle6_1_2", {1, 2, 1, 5}, "triangleTopLeftShape")
    newShape("shape","triangle7_1_2", {1, 2, 4, 5}, "triangleTopRightShape")
    newShape("shape","bar2_1_2", {1, 2, 5, 5}, "bar", {"vert"})
    newShape("shape","triangle8_1_2", {1, 2, 6, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","redCoin", {1, 2, 2, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 7, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 1, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 1}, 225)
    newShape("item","coins", {1, 1, 2, 3}, 85)
    newShape("item","coins", {1, 2, 1, 4}, 60)
    newShape("item","coins", {1, 2, 5, 5}, 3)
    newShape("item","clock", {1, 1, 5, 1, "clock1_1_1", 10, 1})
    newShape("item","big-present", {1, 1, 7, 2}, {})
    newShape("item","small-present", {1, 2, 6, 3}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
