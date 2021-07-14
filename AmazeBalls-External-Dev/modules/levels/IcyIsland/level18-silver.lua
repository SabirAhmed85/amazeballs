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
    newShape("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"horz", 2})
    newShape("endPoint","endPoint1_1_1", {1, 1, 2, 1})
    newShape("shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle2_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("backFire","backFire1_1_1", {1, 1, 7, 3})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,7,1},{1,1,7,3}})
    newShape("item","mystery-block", {1, 1, 2, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    })
    newShape("shape","triangle3_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, _, "fire"})
    newShape("item","mystery-block", {1, 1, 5, 5}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"right"} } }
    })
    newShape("shape","bar2_1_1", {1, 1, 2, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    newShape("manualFan","manualFan1_2_1", {2, 1, 2, 1}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"vert", 2})
    newShape("autoFan","autoFan1_2_1", {2, 1, 3, 2}, "right")
    newShape("manualFan","manualFan2_2_1", {2, 1, 5, 2}, "up")
    newShape("autoFan","autoFan2_2_1", {2, 1, 6, 2}, "down")
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("manualFan","manualFan3_2_1", {2, 1, 4, 3}, "left")
    newShape("shape","triangle2_2_1", {2, 1, 3, 4}, "triangleBottomRightShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,4},{2,1,5,5}})
    newShape("autoFan","autoFan3_2_1", {2, 1, 6, 4}, "right")
    newShape("door","door1_2_1", {2, 1, 7, 4}, "right")
    newShape("autoFan","autoFan4_2_1", {2, 1, 2, 5}, "down")
    newShape("autoFan","autoFan5_2_1", {2, 1, 4, 5}, "down")

    --SCREEN 2-2
    newShape("door","door1_2_2", 3, 1, 1, 1}, "left")
    newShape("manualFan","manualFan1_2_2", 3, 1, 3, 1}, "down")
    newShape("autoFan","autoFan1_2_2", 3, 1, 7, 1}, "left")
    newShape("manualFan","manualFan2_2_2", 3, 1, 1, 2}, "down")
    newShape("manualFan","manualFan3_2_2", 3, 1, 4, 2}, "left")
    newShape("shape","triangle1_2_2", 3, 1, 5, 2}, "triangleBottomRightShape")
    newTransition("triangle1_2_2", "slide", {}, {{3,1,4,4},{3,1,4,3,"*"},{3,1,5,3},{3,1,5,2}})
    newShape("autoFan","autoFan2_2_2", 3, 1, 6, 2}, "up")
    newTransition("autoFan2_2_2", "slide", {}, {{3,1,6,2},{3,1,6,3,"*"},{3,1,7,3}})
    newShape("autoFan","autoFan3_2_2", 3, 1, 3, 3}, "left")
    newShape("autoFan","autoFan4_2_2", 3, 1, 7, 4}, "up")
    newShape("door","door2_2_2", 3, 1, 1, 5}, "left")
    newShape("shape","triangle2_2_2", 3, 1, 1, 5}, "triangleTopLeftShape")
    newShape("autoFan","autoFan5_2_2", 3, 1, 5, 5}, "left")
    newTransition("autoFan5_2_2", "slide", {}, {{3,1,5,4},{3,1,5,5}})

    --GEMS
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 7, 4}, "purple")
    newShape("gem","purple", {2, 1, 5, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 5}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {3, 1, 2, 4}, "purple")
    newShape("gem","purple", {3, 1, 3, 4}, "purple")
    newShape("gem","purple", {3, 1, 6, 4}, "purple")
    newShape("gem","purple", {3, 1, 7, 2}, "purple")
    newShape("gem","purple", {3, 1, 6, 1}, "purple")
    newShape("gem","purple", {3, 1, 4, 1}, "purple")
    newShape("gem","purple", {3, 1, 2, 1}, "purple")
    newShape("gem","purple", {3, 1, 3, 2}, "purple")
    newShape("gem","purple", {3, 1, 1, 3}, "purple")
    newShape("gem","purple", {3, 1, 2, 5}, "purple")
    newShape("gem","purple", {3, 1, 4, 5}, "purple")
    newShape("gem","purple", {3, 1, 7, 5}, "purple")
    newShape("gem","redCoin", {2, 1, 1, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 1, 1}, "blueCoin")
    newShape("gem","purpleCoin", {3, 1, 2, 3}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 3, 5}, 12)
    newShape("item","coins", {2, 1, 5, 3}, 14)
    newShape("item","small-present", {3, 1, 1, 4}, {})
    newShape("item","clock", {1, 1, 4, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
