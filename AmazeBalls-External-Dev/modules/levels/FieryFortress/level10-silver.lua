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
    newShape("simple", "simple1_1_1", {1, 1, 4, 1})
    newTransition("simple1_1_1", "slide", {}, {{1,1,4,1},{1,1,4,2,"*"},{1,1,5,2},{1,1,5,4},{1,1,5,5}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 5, 1}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {2})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 2}, "right")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 2, 2}, "down")
    newShape("door", "door1_1_1", {1, 1, 7, 2}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1})
    newShape("autoFan", "autoFan4_1_1", {1, 1, 4, 4}, "left")
    newShape("shape", "triangle3_1_1", {1, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    newShape("door", "door2_1_1", {1, 1, 7, 5}, "right", {"disabled"})

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 1, 1}, "right")
    newTransition("autoFan1_2_1", "switchSlide", {}, {{2,1,1,1},{2,1,1,2}})
    newShape("shape", "bar1_2_1", {2, 1, 2, 1}, "bar", {"vert", 3})
    newShape("endPoint", "endPoint1_2_1", {2, 1, 4, 2})
    newShape("shape", "triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("shape", "triangle2_2_1", {2, 1, 3, 2}, "triangleBottomLeftShape", {1})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 3, 3}, "right")
    newShape("shape", "triangle3_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("shape", "triangle4_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 1, 4}, "up")
    newShape("shape", "triangle5_2_1", {2, 1, 2, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("backFire", "backFire1_2_1", {2, 1, 4, 4}, "left")
    newTransition("backFire1_2_1", "slide", {"lightDarkBlue"}, {{2,1,4,4},{2,1,4,5}})
    newShape("autoFan", "autoFan4_2_1", {2, 1, 3, 5}, "down")
    newShape("door", "door2_2_1", {2, 1, 3, 5}, "down")
    newShape("autoFan", "autoFan5_2_1", {2, 1, 6, 5}, "left")


    --SCREEN 2-2
    newShape("shape", "triangle1_2_2", {2, 2, 1, 1}, "triangleBottomRightShape", {1})
    newShape("door", "door1_2_2", {2, 2, 4, 1}, "up")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 7, 1}, "down")
    newShape("autoFan", "autoFan2_2_2", {2, 2, 4, 3}, "up")
    newShape("shape", "triangle2_2_2", {2, 2, 7, 3}, "triangleTopRightShape", {1})
    newTransition("triangle2_1_2", "slide", {}, {{2,2,5,1},{2,2,5,3,"*"},{2,2,7,3}})
    newShape("shape", "triangle3_2_2", {2, 2, 1, 5}, "triangleTopRightShape", {1})
    newShape("simple", "simple1_2_2", {2, 2, 5, 5})
    newTransition("simple1_1_2", "slide", {}, {{2,2,3,5},{2,2,5,5}})
    newShape("autoFan", "autoFan3_2_2", {2, 2, 7, 5}, "left")

    --SWITCHES
    newShape("switch", "switch1_2_1", {2, 1, 4, 1}, { {"door-open", "door2_1_1"} }, {"one-way", "not-labelled"})
    newShape("switch", "switch1_2_1", {2, 1, 7, 4}, { {"slide", "autoFan1_2_1"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 3}, "purple")
    newShape("gem", "purple", {2, 2, 3, 3}, "purple")
    newShape("gem", "purple", {2, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 2, 4, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 1}, "purple")
    newShape("gem", "redCoin", {1, 1, 3, 5}, "redCoin")
    newShape("gem", "blueCoin", {2, 2, 6, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 6, 1}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 1, 1, 4}, 70)
    newShape("item", "coins", {2, 1, 1, 3}, 85)
    newShape("item", "coins", {1, 1, 6, 3}, 130)
    newShape("item", "coins", {1, 1, 3, 1}, 65)
    newShape("item", "coins", {2, 1, 7, 2}, 180)
    newShape("item", "coins", {2, 2, 3, 1}, 90)
    newShape("item", "big-present", {2, 1, 3, 4}, {})
    newShape("item", "small-present", {1, 1, 4, 3}, {})



end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t