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

    -- SCREEN 1-1
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 1}, "down")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 3, 2}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    newShape("item", "big-present", {1, 1, 1, 3, "present1_1_1", 
                                            { 
                                                -- put BOMB here
                                                {"item", "clock", {1, 1, 3, 2, "clock1_1_1", 10, 1},
                                                {"triangle", "triangleTopRightShape"},
                                            } 
                                        })
    newShape("shape", "triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 4, 3}, "triangleBottomRightShape")
    newShape("simple", "simple1_1_1", {1, 1, 7, 3})
    newShape("autoFan", "autoFan3_1_1", {1, 1, 1, 5}, "right")
    newShape("shape", "triangle4_1_1", {1, 1, 3, 5}, "triangleTopLeftShape")
    newShape("shape", "triangle5_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    newShape("door", "door1_1_1", {1, 1, 6, 5}, "down")

    -- 2-1
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 1}, "down")
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("shape", "triangle2_1_2", {1, 2, 6, 1}, "triangleTopLeftShape", {1, 5})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 6, 2}, "right")
    newShape("shape", "bar1_1_2", {1, 2, 8, 2}, "bar", {"horz", 4})
    newShape("shape", "bar2_1_2", {1, 2, 6, 3}, "bar", {"vert", 4})
    newShape("backFire", "backFire1_1_2", {1, 2, 6, 3})
    newTransition("backFire1_1_2", "slide", {"lightDarkBlue"}, {{1,2,6,3},{1,2,6,4}})
    newShape("shape", "bar3_1_2", {1, 2, 8, 3}, "bar", {"horz", 4})
    newShape("shape", "bar4_1_2", {1, 2, 1, 5}, "bar", {"horz", 4})
    newShape("shape", "triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    newTransition("triangle3_1_2", "slide", {}, {{1,2,1,4},{1,2,1,5}})
    newShape("backFire", "backFire2_1_2", {1, 2, 3, 5})
    newTransition("backFire2_1_2", "slide", {"lightDarkBlue"}, {{1,2,3,2},{1,2,3,3},{1,2,3,5}})

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 7, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 4, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "big-present", {1, 1, 1, 3}, {})

    newShape("item", "small-present", {1, 2, 7, 4}, {})

    --newShape("item", "coins", {1, 1, 4, 1}, 90)
    --newShape("item", "coins", {1, 2, 6, 4}, 250)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
