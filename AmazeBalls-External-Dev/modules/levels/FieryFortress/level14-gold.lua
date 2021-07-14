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
    newShape("autoFan","autoFan1_1_1", {1, 1, 4, 1}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("item","compass", {1, 1, 1, 2})
    newShape("shape","bar1_1_1", {1, 1, 4, 2}, "bar", {"horz", 4})
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 2}, "up")
    newTransition("autoFan2_1_1", "slide", {"orange"}, {{1,1,6,1},{1,1,6,2}})
    newShape("shape","bar2_1_1", {1, 1, 7, 2}, "bar", {"horz", 4})
    newTransition("bar2_1_1", "switchSlide", {timePerSquare = 400}, {{1,1,7,2},{1,1,7,4}})
    newShape("shape","bar3_1_1", {1, 1, 2, 3}, "bar", {"horz", 3})
    newShape("backFire","backFire1_1_1", {1, 1, 3, 3})
    newTransition("backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,3,2},{1,1,3,3},{1,1,3,4}})
    newShape("shape","bar4_1_1", {1, 1, 4, 3}, "bar", {"horz", 2})
    newShape("autoFan","autoFan3_1_1", {1, 1, 6, 3}, "right")
    newShape("shape","bar5_1_1", {1, 1, 1, 4}, "bar", {"horz"})
    newShape("item","map", {1, 1, 1, 4})
    newShape("shape","bar6_1_1", {1, 1, 4, 4}, "bar", {"horz", 4})
    newShape("shape","triangle1_1_1", {1, 1, 6, 4}, "triangleBottomRightShape", {1, 8})
    newTransition("triangle1_1_1", "slide", {"green"}, {{1,1,5,5},{1,1,5,4},{1,1,6,4}})
    newShape("simple","simple1_1_1", {1, 1, 7, 4})
    newTransition("simple1_1_1", "slide", {"lightBlue"}, {{1,1,7,2},{1,1,7,3},{1,1,7,4}})
    newShape("door","door2_1_1", {1, 1, 7, 4}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, 13})

    -- 1-2
    newShape("shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle2_2_1", {2, 1, 4, 2}, "triangleTopAndBottomShape", {2})
    newTransition("triangle2_2_1", "slide", {"green"}, {{2,1,3,2},{2,1,4,2}})
    newShape("endPoint","endPoint1_2_1", {2, 1, 6, 2})
    newShape("shape","triangle3_2_1", {2, 1, 1, 3}, "triangleTopRightShape", {1, 16})
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 3}, "right")
    newShape("shape","bar1_2_1", {2, 1, 2, 4}, "bar", {"vert", 3})
    newTransition("bar1_2_1", "slide", {"brown"}, {{2,1,2,4},{2,1,3,4}})
    newShape("autoFan","autoFan2_2_1", {2, 1, 4, 3}, "up")
    newShape("shape","triangle4_2_1", {2, 1, 1, 4}, "triangleTopLeftShape")
    newTransition("triangle4_2_1", "slide", {"green"}, {{2,1,1,4},{2,1,2,4},{2,1,2,5}})
    newShape("door","door1_2_1", {2, 1, 1, 5}, "left")
    newShape("autoFan","autoFan3_2_1", {2, 1, 7, 5}, "left")

    --ALL SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 2, 2}, { {"slide","bar2_1_1"} })

    newShape("switch","switch1_1_2", {1, 2, 4, 2}, { {"slide","bar2_1_2"},{"slide","bar7_1_2"} })
    newShape("switch","switch2_1_2", {1, 2, 3, 3}, { {"slide","bar5_1_2"} })

    --GEMS
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 1}, "purple")
    newShape("gem","purple", {2, 1, 5, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 4}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 2, 2}, "purpleCoin")
    --ITEMS
    newShape("item","small-present", {2, 1, 1, 2}, {})

    --newShape("item","coins", {1, 1, 1, 3}, 90)
    --newShape("item","coins", {2, 1, 7, 3}, 90)

    --newShape("item","something", 1, 1, 5, 2})
    --newShape("item","something", 1, 2, 4, 3})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
