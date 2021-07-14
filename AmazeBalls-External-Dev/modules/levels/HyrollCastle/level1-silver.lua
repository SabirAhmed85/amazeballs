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
    newShape("simple","simple1_1_1", {1, 1, 1, 1})
    newTransition("simple1_1_1", "slide", {"lightBlue"}, {{1,1,1,1},{1,1,2,1},{1,1,5,1}})
    newShape("shape","bar1_1_1", {1, 1, 6, 1}, "bar", {"horz", 3})
    newShape("autoFan","autoFan1_1_1", {1, 1, 7, 1}, "left")
    newShape("backFire","backFire1_1_1", {1, 1, 6, 2})
    newTransition("backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,6,1},{1,1,6,2}})
    newShape("shape","triangle1_1_1", {1, 1, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("autoFan","autoFan2_1_1", {1, 1, 1, 5}, "right")
    newTransition("autoFan2_1_1", "slide", {"lightBlue"}, {{1,1,1,5},{1,1,3,5},{1,1,4,5},{1,1,5,5}})
    newShape("door","door1_1_1", {1, 1, 2, 5}, "down")
    newShape("door","door2_1_1", {1, 1, 3, 5}, "down")
    newShape("door","door3_1_1", {1, 1, 4, 5}, "down")
    newShape("door","door4_1_1", {1, 1, 5, 5}, "down")
    newShape("autoFan","autoFan3_1_1", {1, 1, 7, 5}, "up")

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 3, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 4, 1}, "up")
    newShape("door","door3_1_2", {1, 2, 5, 1}, "up")
    newShape("door","door4_1_2", {1, 2, 7, 1}, "up")
    newShape("shape","bar1_1_2", {1, 2, 2, 2, "doubleBar", "vert"})
    newShape("shape","bar2_1_2", {1, 2, 4, 2, "doubleBar", "vert"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 1, 2}, "right")
    newShape("manualFan","manualFan2_1_2", {1, 2, 2, 2}, "right")
    newShape("item","map", {1, 2, 4, 2})
    newShape("simple","simple1_1_2", {1, 2, 5, 2})
    newTransition("simple1_1_2", "slide", {"lightBlue"}, {{1,2,5,2},{1,2,5,3}})
    newShape("shape","triangle1_1_2", {1, 2, 7, 3}, "triangleLeftAndRightShape", {2})
    newTransition("triangle1_1_2", "slide", {"green"}, {{1,2,7,2},{1,2,7,3}})
    newShape("item","mystery-block", {1, 2, 3, 4}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    newShape("door","door5_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 1-3
    newShape("shape","triangle1_1_3", {1, 3, 3, 2}, "triangleBottomRightShape", {1, 8})
    newShape("manualFan","manualFan1_1_3", {1, 3, 6, 2}, "left")
    newTransition("manualFan1_1_3", "slide", {"silver"}, {{1,3,6,2},{1,3,7,2}})
    newShape("shape","triangle1_1_3", {1, 3, 2, 3}, "triangleBottomRightShape", {1})
    newShape("manualFan","manualFan2_1_3", {1, 3, 5, 3}, "down")
    newShape("manualFan","manualFan3_1_3", {1, 3, 6, 3}, "right")
    newTransition("manualFan3_1_3", "slide", {"silver"}, {{1,3,6,3},{1,3,7,3}})
    newShape("shape","triangle1_1_3", {1, 3, 1, 4}, "triangleBottomRightShape", {1, 8})
    newShape("manualFan","manualFan4_1_3", {1, 3, 5, 4}, "right")
    newTransition("manualFan4_1_3", "slide", {"silver"}, {{1,3,5,4},{1,3,7,4}})
    newShape("manualFan","manualFan5_1_3", {1, 3, 3, 5}, "down")
    newTransition("manualFan5_1_3", "slide", {"silver"}, {{1,3,2,4},{1,3,3,5}})
    newShape("endPoint","endPoint1_1_3", {1, 3, 2, 5})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 3, 7, 1}, "purple")
    newShape("gem","purple", {1, 3, 7, 5}, "purple")
    newShape("gem","purple", {1, 3, 3, 3}, "purple")
    newShape("gem","purple", {1, 3, 4, 4}, "purple")
    newShape("gem","purple", {1, 3, 5, 1}, "purple")
    newShape("gem","purple", {1, 3, 5, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 3, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 3, 1, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 2}, 100)
    newShape("item","bomb", {1, 2, 3, 1, "bomb2_1_1", {3, "right", "left", "up"}, 3})
    newShape("item","clock", {1, 1, 1, 3, "clock1_1_1", 10, 1})
    newShape("item","coins", {1, 2, 2, 4}, 21)
    newShape("item","coins", {1, 2, 1, 4}, 4)
    newShape("item","coins", {1, 2, 6, 1, 42)
    newShape("item","coins", {1, 3, 4, 2, 125})
    newShape("item","big-present", {1, 2, 4, 1}, {})
    newShape("item","small-present", {1, 1, 4, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
