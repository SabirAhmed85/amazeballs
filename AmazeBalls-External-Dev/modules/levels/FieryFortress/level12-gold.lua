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
    newShape("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert"})
    newShape("shape","triangle1_1_1", {1, 1, 2, 1, "triangleTopAndBottomShape", 2, 19})
    newTransition("triangle1_1_1", "slide", {"green"}, {{1,1,2,1},{1,1,3,1}})
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 1}, "left")
    newShape("shape","triangle2_1_1", {1, 1, 1, 2}, "triangleTopLeftShape")
    newShape("shape","bar2_1_1", {1, 1, 4, 3}, "bar", {"vert", 4})
    newTransition("bar2_1_1", "switchSlide", {timePerSquare = 400}, {{1,1,4,3},{1,1,5,3}})
    newShape("shape","triangle3_1_1", {1, 1, 6, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomRightShape")
    newShape("shape","triangle6_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, 3})
    newShape("shape","triangle7_1_1", {1, 1, 3, 4}, "triangleBottomLeftShape")
    newShape("shape","triangle8_1_1", {1, 1, 6, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle9_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    newShape("backFire","backFire1_1_1", {1, 1, 2, 5})
    newTransition("backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,1,5},{1,1,2,5},{1,1,4,5}})
    newShape("door","door1_1_1", {1, 1, 3, 5}, "down")
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 5}, "left")

    -- 1-2
    newShape("door","door1_1_2", {1, 2, 2, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("door","door2_1_2", {1, 2, 4, 1}, "up")
    newShape("shape","bar1_1_2", {1, 2, 5, 1}, "bar", {"horz"})
    newShape("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle2_1_2", "slide", {"green"}, {{1,2,5,1},{1,2,6,1}})
    newShape("backFire","backFire1_1_2", {1, 2, 7, 1})
    newShape("shape","triangle3_1_2", {1, 2, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 4, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle5_1_2", {1, 2, 6, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("item","compass", {1, 2, 5, 3})
    newShape("shape","triangle6_1_2", {1, 2, 6, 3}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape","triangle7_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","triangle8_1_2", {1, 2, 2, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("item","map", {1, 2, 3, 4})
    newShape("shape","triangle9_1_2", {1, 2, 4, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("backFire","backFire2_1_2", {1, 2, 1, 5})
    newShape("shape","triangle10_1_2", {1, 2, 2, 5}, "triangleTopLeftShape")
    newShape("shape","bar2_1_2", {1, 2, 6, 4}, "bar", {"horz"})
    newShape("endPoint","endPoint1_1_2", {1, 2, 6, 4})
    newShape("shape","bar3_1_2", {1, 2, 7, 4}, "bar", {"horz"})
    newShape("autoFan","autoFan5_1_2", {1, 2, 3, 5}, "right")
    newShape("shape","triangle11_1_2", {1, 2, 2, 5}, "triangleTopLeftShape")
    newShape("shape","bar4_1_2", {1, 2, 6, 5}, "bar", {"vert"})
    newShape("shape","triangle12_1_2", {1, 2, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --ALL SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 7, 2}, { {"slide","bar2_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 1, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 6, 5}, "purpleCoin")
    --ITEMS
    newShape("item","small-present", {1, 1, 3, 2}, {})

    --newShape("item","coins", {1, 1, 2, 2}, 20)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
