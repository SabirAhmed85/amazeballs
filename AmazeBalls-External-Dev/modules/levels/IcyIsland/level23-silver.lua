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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("characterChangePoint","characterChangePoint1_1_1", {1, 1, 5, 1})
    newShape("backFire","backFire1_1_1", {1, 1, 2, 2})
    newShape("shape","triangle2_1_1", {1, 1, 7, 3}, "triangleLeftAndRightShape", {1})
    newTransition("triangle2_1_1", "flip-horizontal")
    newShape("door","door1_1_1", {1, 1, 7, 3}, "right")
    newShape("shape","triangle3_1_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("shape","triangle4_1_1", {1, 1, 3, 4}, "triangleLeftAndRightShape", {2})
    newTransition("triangle4_1_1", "flip-horizontal")
    newShape("shape","triangle5_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 6, 1}, "triangleBottomRightShape", {1, 14, "icy"})
    newShape("shape","bar1_2_1", {2, 1, 8, 1}, "bar", {"horz", 2})
    newShape("shape","bar2_2_1", {2, 1, 1, 2}, "bar", {"vert", 2})
    newShape("shape","bar3_2_1", {2, 1, 3, 2}, "bar", {"vert", 4})
    newShape("manualFan","manualFan2_2_1", {2, 1, 4, 2}, "right")
    newTransition("manualFan2_2_1", "slide", {}, {{2,1,2,1},{2,1,4,2}})
    newShape("door","door2_2_1", {2, 1, 7, 3}, "right", {"disabled"})
    newShape("manualFan","manualFan3_2_1", {2, 1, 1, 4}, "down")
    newTransition("manualFan3_2_1", "slide", {}, {{2,1,1,4},{2,1,2,2},{2,1,3,2}})
    newShape("shape","bar4_2_1", {2, 1, 3, 4}, "bar", {"horz", 3})
    newShape("backFire","backFire1_2_1", {2, 1, 5, 4})
    newTransition("backFire1_2_1", "slide", {}, {{2,1,3,4},{2,1,5,4}})
    newShape("shape","bar5_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    newShape("shape","bar6_2_1", {2, 1, 5, 5}, "bar", {"vert", 4})
    newShape("simple","simple1_2_1", {2, 1, 6, 5})
    newTransition("simple1_2_1", "slide", {}, {{2,1,5,5},{2,1,6,5},{2,1,6,4},{2,1,7,3}})
    newShape("shape","triangle2_2_1", {2, 1, 7, 5}, "triangleBottomLeftShape", {1, 4, "icy"})
    newShape("shape","bar7_2_1", {2, 1, 3, 6}, "bar", {"vert", 3})

    --SCREEN 3-1
    newShape("shape","triangle2_3_1", {3, 1, 4, 1}, "triangleBottomLeftShape")
    newShape("spitter","spitter1_3_1", {3, 1, 1, 3, "up","right","none","none"})
    newTransition("spitter1_3_1", "slide", {}, {{3,1,1,1},{3,1,1,3}})
    newShape("shape","bar1_3_1", {3, 1, 3, 3}, "bar", {"horz", 2})
    newShape("shape","bar2_3_1", {3, 1, 3, 3}, "bar", {"vert", 2})
    newShape("endPoint","endPoint1_3_1", {3, 1, 3, 3})
    newShape("item","mystery-block", {3, 1, 4, 3}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"up","left"} } }
    })
    newShape("item","mystery-block", {3, 1, 7, 3}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","left"} } }
    })
    newShape("shape","bar3_3_1", {3, 1, 3, 4}, "bar", {"vert", 3})
    newShape("spitter","spitter2_3_1", {3, 1, 7, 4, "up","none","none","none"})
    newTransition("spitter2_3_1", "autoSlide", {timePerSlide = 600}, {{3,1,7,4},{3,1,7,5}})
    newShape("shape","triangle2_3_1", {3, 1, 4, 5}, "triangleTopRightShape", {1, 13})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 1, 3}, { {"door-open", "door2_2_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 5}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 1}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {3, 1, 3, 1}, "purple")
    newShape("gem","purple", {3, 1, 4, 2}, "purple")
    newShape("gem","purple", {3, 1, 4, 4}, "purple")
    newShape("gem","purple", {3, 1, 5, 5}, "purple")
    newShape("gem","purple", {3, 1, 1, 5}, "purple")
    newShape("gem","purple", {3, 1, 2, 5}, "purple")
    newShape("gem","purple", {3, 1, 7, 1}, "purple")
    newShape("gem","purple", {3, 1, 5, 3}, "purple")
    newShape("gem","purple", {3, 1, 1, 4}, "purple")
    newShape("gem","redCoin", {3, 1, 3, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 3, 5}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {2, 1, 7, 1}, 225)
    newShape("item","coins", {3, 1, 6, 3}, 310)
    newShape("item","big-present", {3, 1, 2, 3}, {})
    newShape("item","small-present", {2, 1, 1, 2}, {})
    newShape("item","small-present", {1, 1, 5, 4}, {})
    newShape("item","bomb", {1, 1, 2, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
