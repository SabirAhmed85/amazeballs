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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 1}, "left")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,4,1},{1,1,4,2}})
    newShape("shape", "triangle1_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1, 9})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, 9})
    newShape("shape", "bar1_1_1", {1, 1, 5, 2}, "bar", {"vert"})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 3}, "down")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,1,1},{1,1,1,3}})
    newShape("shape", "triangle3_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle3_1_1", "slide", {}, {{1,1,4,3},{1,1,5,3},{1,1,6,2}})
    newShape("shape", "triangle4_1_1", {1, 1, 6, 4}, "triangleTopLeftShape", {1, 5})
    newShape("door", "door1_1_1", {1, 1, 7, 4}, "right")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 1, 5}, "right")
    newShape("shape", "triangle5_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    newTransition("triangle5_1_1", "slide", {}, {{1,1,2,4},{1,1,2,5,"*"},{1,1,4,5}})
    newShape("door", "door2_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_2_1", {2, 1, 4, 3}, "triangleTopRightShape")
    newShape("shape", "triangle3_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape")
    newShape("door", "door2_2_1", {2, 1, 1, 4}, "left")
    newShape("shape", "triangle4_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,2,4},{2,1,3,5}})
    newShape("door", "door3_2_1", {2, 1, 2, 5}, "down")

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, 2})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,3,1},{1,2,5,1},{1,2,5,3,"*"},{1,2,6,3}})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 6, 1}, "left")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,6,1},{1,2,6,2}})
    newShape("shape", "bar1_1_2", {1, 2, 6, 3}, "bar", {"vert", 2})
    newShape("shape", "bar2_1_2", {1, 2, 7, 3}, "bar", {"vert", 2})
    newShape("shape", "bar3_1_2", {1, 2, 5, 4}, "bar", {"horz"})
    newShape("door", "door1_1_2", {1, 2, 7, 4}, "right")
    newShape("simple", "simple1_1_2", {1, 2, 1, 5})
    newTransition("simple1_1_2", "slide", {}, {{1,2,1,2},{1,2,1,3},{1,2,1,5}})
    newShape("shape", "bar4_1_2", {1, 2, 3, 5}, "bar", {"horz"})
    newTransition("bar4_1_2", "slide", {}, {{1,2,3,3},{1,2,3,4},{1,2,3,5}})
    newShape("shape", "bar5_1_2", {1, 2, 5, 5}, "bar", {"horz", 2})
    newShape("item", "mystery-block", {1, 2, 5, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "spitter", properties = {directions = {"up", "right", "down"} } }
    })
    newShape("door", "door2_1_2", {1, 2, 5, 5}, "down")
    newShape("door", "door3_1_2", {1, 2, 6, 5}, "down")

    --SCREEN 2-2
    newShape("door", "door1_2_2", {2, 2, 2, 1}, "up")
    newShape("door", "door2_2_2", {2, 2, 6, 1, "up", "disabled"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 7, 1}, "up")
    newTransition("autoFan1_2_2", "switchSlide", {}, {{2,2,6,1},{2,2,7,1}})
    newShape("simple", "simple1_2_2", {2, 2, 2, 2}, "up")
    newTransition("simple1_2_2", "slide", {}, {{2,2,2,2},{2,2,3,2}})
    newShape("shape", "triangle1_2_2", {2, 2, 6, 2}, "triangleLeftAndRightShape", {2})
    newTransition("triangle1_2_2", "slide", {}, {{2,2,5,4},{2,2,6,2},{2,2,7,2}})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 2, 3}, "up")
    newTransition("autoFan2_2_2", "slide", {}, {{2,2,1,3},{2,2,2,3}})
    newShape("door", "door3_2_2", {2, 2, 1, 4}, "left")
    newShape("shape", "triangle2_2_2", {2, 2, 2, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle3_2_2", {2, 2, 3, 4}, "triangleLeftAndRightShape", {1})
    newTransition("triangle3_2_2", "switchSlide", {}, {{2,2,3,3},{2,2,3,4}})
    newShape("shape", "triangle4_2_2", {2, 2, 4, 5}, "triangleBottomRightShape")
    newTransition("triangle4_2_2", "slide", {}, {{2,2,4,5},{2,2,4,1},{2,2,5,1}})

    --SCREEN 1-3
    --newShape("timeOut", "timeOut1_1_3", {1, 3, 5, 1, 1})
    newShape("shape", "triangle1_1_3", {1, 3, 3, 2}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape", "triangle2_1_3", {1, 3, 5, 2}, "triangleTopLeftShape")
    newShape("shape", "triangle3_1_3", {1, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("backFire", "backFire1_1_3", {1, 3, 2, 3})
    newTransition("backFire1_1_3", "slide", {}, {{1,3,2,3},{1,3,2,4},{1,3,2,5}})
    newShape("shape", "triangle4_1_3", {1, 3, 3, 3}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape", "triangle5_1_3", {1, 3, 5, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle6_1_3", {1, 3, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle7_1_3", {1, 3, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "bar1_1_3", {1, 3, 5, 5}, "bar", {"horz"})
    newTransition("bar1_1_3", "slide", {}, {{1,3,5,4},{1,3,5,5}})
    newShape("endPoint", "endPoint1_1_3", {1, 3, 6, 5})
    newShape("shape", "triangle8_1_3", {1, 3, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 1, 4}, { {"flip-horizontal", "triangle4_1_1"} })
    newShape("switch", "switch2_1_1", {1, 1, 3, 4}, { {"flip-horizontal", "triangle1_1_1"} })

    newShape("switch", "switch1_2_1", {2, 1, 2, 5}, { {"slide", "autoFan1_2_2"},{"door-open", "door2_2_2"} }, {"one-way", "not-labelled"})
    newShape("switch", "switch1_2_2", {2, 2, 1, 4}, { {"slide", "triangle3_2_2"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 5}, "purple")
    newShape("gem", "purple", {2, 2, 3, 1}, "purple")
    newShape("gem", "purple", {2, 2, 7, 5}, "purple")
    newShape("gem", "purple", {2, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 3, 5, 1}, "purple")
    newShape("gem", "purple", {1, 3, 4, 2}, "purple")
    newShape("gem", "purple", {1, 3, 1, 3}, "purple")
    newShape("gem", "purple", {1, 3, 1, 5}, "purple")
    newShape("gem", "purple", {1, 3, 3, 4}, "purple")
    newShape("gem", "purple", {1, 3, 6, 4}, "purple")
    newShape("gem", "purple", {1, 3, 7, 4}, "purple")
    newShape("gem", "purple", {1, 3, 6, 2}, "purple")
    newShape("gem", "purple", {1, 3, 5, 5}, "purple")
    newShape("gem", "redCoin", {1, 3, 4, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 5, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 5, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 5, 5}, 170)
    newShape("item", "coins", {1, 2, 2, 1}, 125)
    newShape("item", "coins", {2, 1, 6, 5}, 65)
    newShape("item", "coins", {2, 2, 7, 4}, 125)
    newShape("item", "coins", {1, 3, 6, 3}, 110)
    newShape("item", "big-present", {2, 2, 5, 3}, {})
    newShape("item", "small-present", {2, 2, 5, 2}, {})
    newShape("item", "small-present", {1, 2, 5, 4}, {})
    newShape("item", "small-present", {1, 3, 7, 3}, {})
    newShape("item", "bomb", {1, 1, 3, 1}, {})
    newShape("item", "hook", {2, 1, 2, 1}, {})
    newShape("item", "characterSpecial", {2, 2, 1, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
