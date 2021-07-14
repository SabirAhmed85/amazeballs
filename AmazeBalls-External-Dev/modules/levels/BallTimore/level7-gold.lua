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
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 3, 4}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape", "bar1_1_1", {1, 1, 8, 4}, "bar", {"horz", 3})
    newShape("door", "door1_1_1", {1, 1, 3, 5}, "down")

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_2", {1, 2, 2, 1}, "triangleBottomRightShape", {1, 21, "breakable"})
    newShape("shape", "triangle3_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape")
    newTransition("triangle3_1_2", "slide", {}, {{1,2,4,1},{1,2,5,1}})
    newShape("door", "door1_1_2", {1, 2, 6, 1}, "up")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 2, 2}, "right")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,1,2},{1,2,2,2},{1,2,3,2}})
    newShape("shape", "triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 2, 4}, "up")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,2,4},{1,2,3,4},{1,2,4,4},{1,2,4,5}})
    newShape("autoFan", "autoFan3_1_2", {1, 2, 7, 4}, "down")
    newTransition("autoFan3_1_2", "slide", {}, {{1,2,7,2},{1,2,7,4}})
    newShape("autoFan", "autoFan4_1_2", {1, 2, 1, 5}, "right")
    newShape("shape", "triangle4_1_2", {1, 2, 7, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("door", "door2_1_2", {1, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 2-2
    newShape("shape", "bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3})
    newShape("spitter", "spitter1_1_1", 2, 2, 1, 1}, {"none", "none", "down", "none"})
    newTransition("spitter1_1_1", "autoSlide", {timePerSlide=480}, {{2,2,1,1},{2,2,7,1}})
    newShape("shape", "bar2_2_2", {2, 2, 7, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle1_2_2", {2, 2, 2, 2}, "triangleBottomRightShape")
    newShape("shape", "triangle2_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape")
    newShape("item", "mystery-block", {2, 2, 3, 3}, {
        {name = "backFire"},
        {name = "simple"},
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"left"} } }
    })
    newShape("shape", "triangle3_2_2", {2, 2, 4, 3}, "triangleBottomRightShape", {1, 3})
    newShape("item", "mystery-block", {2, 2, 5, 3}, {
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"down", "left"} } }
    })
    newShape("simple", "simple1_2_2", {2, 2, 1, 4})
    newTransition("simple1_2_2", "slide", {}, {{2,2,1,4},{2,2,2,4}})
    newShape("backFire", "backFire1_2_2", {2, 2, 7, 4})
    newTransition("backFire1_2_2", "slide", {}, {{2,2,6,4},{2,2,7,4}})
    newShape("shape", "triangle4_2_2", {2, 2, 2, 5}, "triangleTopLeftShape")
    newShape("door", "door1_2_2", {2, 2, 4, 5}, "down")
    newShape("shape", "triangle5_2_2", {2, 2, 6, 5}, "triangleTopRightShape")

    --SCREEN 2-3
    newShape("shape", "triangle4_2_3", {2, 3, 3, 1}, "triangleBottomRightShape", {1, 14, "breakable"})
    newShape("shape", "bar1_2_3", {2, 3, 5, 1}, "bar", {"horz", 4})
    newTransition("bar1_2_3", "switchSlide", {}, {{2,3,5,1},{2,3,5,2}})
    newShape("shape", "triangle4_2_3", {2, 3, 6, 1}, "triangleTopLeftShape", {1, 26, "breakable"})
    newShape("shape", "triangle4_2_3", {2, 3, 7, 1}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("autoFan", "autoFan1_2_3", {2, 3, 4, 2}, "right")
    newShape("autoFan", "autoFan2_2_3", {2, 3, 7, 2}, "down")
    newShape("manualFan", "manualFan1_2_3", {2, 3, 4, 3}, "left")
    newShape("autoFan", "autoFan3_2_3", {2, 3, 6, 3}, "up")
    newShape("endPoint", "endPoint1_2_3", {2, 3, 1, 4})
    newShape("spitter", "spitter1_2_3", {2, 3, 2, 4}, {"none", "none", "none", "left"})
    newTransition("spitter1_2_3", "switchSlide", {}, {{2,3,2,4},{2,3,3,4}})
    newShape("autoFan", "autoFan4_2_3", {2, 3, 4, 5}, "up")
    newShape("shape", "bar2_2_3", {2, 3, 6, 5}, "bar", {"vert", 4})
    newShape("shape", "triangle4_2_3", {2, 3, 7, 5}, "triangleTopRightShape")

    --SWITCHES
    newShape("switch", "switch1_1_2", {1, 2, 2, 5}, { {"door-open", "door2_1_2"} })

    newShape("switch", "switch1_2_3", {2, 3, 5, 1}, { {"slide", "bar1_2_3"},{"slide", "spitter1_2_3"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
