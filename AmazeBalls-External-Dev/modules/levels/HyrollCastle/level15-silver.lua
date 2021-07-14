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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 1}, "down")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 5, 1}, "left")
    newShape("item", "mystery-block", {1, 1, 2, 2}, {
        {name = "simple"},
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"up", "down", "left"} } }
    })
    newShape("manualFan", "manualFan2_1_1", {1, 1, 4, 2}, "down")
    newShape("manualFan", "manualFan3_1_1", {1, 1, 5, 2}, "up")
    newShape("item", "map", {1, 1, 6, 2})
    newShape("shape", "bar1_1_1", {1, 1, 2, 3}, "bar", {"vert", 2})
    newShape("item", "mystery-block", {1, 1, 2, 3}, {
        {name = "triangle", properties = {shape = "triangleBottomLeftShape"} },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"down", "left"} } }
    })
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")
    newShape("manualFan", "manualFan4_1_1", {1, 1, 4, 4}, "left")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 5}, "down")
    newShape("manualFan", "manualFan5_1_1", {1, 1, 4, 5}, "right")

    --SCREEN 2-1
    newShape("manualFan", "manualFan1_2_1", {2, 1, 1, 1}, "right")
    newShape("simple", "simple1_2_1", {2, 1, 3, 1})
    newShape("endPoint", "endPoint1_2_1", {2, 1, 4, 1})
    newShape("shape", "triangle1_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape")
    newShape("shape", "bar1_2_1", {2, 1, 1, 2}, "bar", {"vert", 4})
    newTransition("bar1_2_1", "slide", {}, {{2,1,1,2},{2,1,3,2}})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 1, 2}, "right")
    newShape("shape", "triangle2_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape")
    newShape("manualFan", "manualFan3_2_1", {2, 1, 1, 3}, "right")
    newShape("shape", "triangle3_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape")
    newShape("shape", "bar2_2_1", {2, 1, 1, 4}, "bar", {"vert", 4})
    newTransition("bar2_2_1", "slide", {}, {{2,1,1,4},{2,1,4,5}})
    newShape("shape", "bar3_2_1", {2, 1, 6, 4}, "bar", {"vert", 4})
    newTransition("bar3_2_1", "slide", {}, {{2,1,1,3},{2,1,6,4}})
    newShape("shape", "triangle4_2_1", {2, 1, 1, 5}, "triangleTopRightShape")
    newShape("manualFan", "manualFan4_2_1", {2, 1, 4, 5}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 5, 5}, "left")
    newShape("autoFan", "autoFan2_2_1", {2, 1, 6, 5}, "left")
    newShape("shape", "bar4_2_1", {2, 1, 4, 6}, "bar", {"vert"})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 2}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 2, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 1, 3, 5}, 90)
    newShape("item", "small-present", {1, 1, 6, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
