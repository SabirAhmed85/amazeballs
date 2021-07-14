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

    -- 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape")
    newShape("shape", "bar1_1_1", {1, 1, 4, 2}, "bar", {"vert", 2})
    newTransition("bar1_1_1", "slide", {"brown"}, {{1,1,3,2},{1,1,4,2}})
    newShape("shape", "triangle3_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, 10})
    newTransition("triangle3_1_1", "slide", {}, {{1,1,1,3},{1,1,3,3}})
    newShape("shape", "triangle4_1_1", {1, 1, 5, 3}, "triangleTopLeftShape")
    newShape("door", "door1_1_1", {1, 1, 3, 5}, "down")

    -- 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("backFire", "backFire1_1_2", {1, 2, 3, 1})
    newTransition("backFire1_1_2", "slide", {"lightDarkBlue"}, {{1,2,1,1},{1,2,3,1},{1,2,5,1}})
    newShape("shape", "triangle1_1_2", {1, 2, 1, 2}, "triangleTopLeftShape", {1, 5})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,2},{1,2,1,3}})
    newShape("characterChangePoint", "characterChangePoint1_1_2", {1, 2, 7, 2})
    newShape("shape", "bar1_1_2", {1, 2, 8, 2}, "bar", {"horz", 3})
    newTransition("bar1_1_2", "switchSlide", {timePerSquare = 100}, {{1,2,8,1},{1,2,8,2}})
    newShape("item", "map", {1, 2, 2, 3})
    newShape("shape", "triangle2_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("simple", "simple1_1_2", {1, 2, 3, 5})
    newTransition("simple1_1_2", "slide", {}, {{1,2,3,3},{1,2,3,4},{1,2,3,5}})
    newShape("shape", "bar2_1_2", {1, 2, 4, 5}, "bar", {"horz", 4})
    newTransition("bar2_1_2", "switchSlide", {timePerSquare = 100}, {{1,2,4,4},{1,2,4,5}})
    newShape("shape", "bar3_1_2", {1, 2, 5, 4}, "bar", {"vert", 4})
    newTransition("bar3_1_2", "autoSlide", {timePerSquare = 550, pauseTime = 0}, {{1,2,5,4},{1,2,6,4}})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 4, 5})
    newShape("shape", "bar4_1_2", {1, 2, 6, 5}, "bar", {"horz", 3})

    -- ALL SWITCHES

    newShape("switch", "switch1_1_1", {1, 1, 4, 1}, { {"slide", "triangle3_1_1"} })
    newShape("switch", "switch2_1_1", {1, 1, 4, 3}, { {"slide", "bar2_1_2"} }, {"one-way"})
    newShape("switch", "switch3_1_1", {1, 1, 3, 5}, { {"slide", "bar1_1_2"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "redCoin", {1, 2, 4, 2}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 5, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 7, 5}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 1, 1, 1}, 70)
    newShape("item", "coins", {1, 1, 5, 2}, 90)
    newShape("item", "coins", {1, 2, 6, 5}, 250)
    newShape("item", "small-present", {1, 2, 7, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
