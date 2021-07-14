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
    
    --SCREEN 2-1
    newShape("autoFan","autoFan1_2_1", {2, 1, 1, 1}, "down")
    newShape("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleTopAndBottomShape", {2})
    newTransition("triangle1_2_1", "slide", {"green"}, {{2,1,3,1},{2,1,4,1}})
    newShape("autoFan","autoFan2_2_1", {2, 1, 7, 1}, "down")
    newShape("shape","triangle2_2_1", {2, 1, 6, 2}, "triangleBottomRightShape")
    newShape("autoFan","autoFan3_2_1", {2, 1, 1, 3}, "right")
    newShape("shape","triangle3_2_1", {2, 1, 4, 3, "triangleTopAndBottomShape", 1, 12})
    newTransition("triangle3_2_1", "slide", {"green"}, {{2,1,3,3},{2,1,4,3}})
    newShape("simple","simple1_2_1", {2, 1, 3, 4})
    newTransition("simple1_2_1", "slide", {"lightBlue"}, {{2,1,2,1},{2,1,2,3},{2,1,2,4,"*"},{2,1,3,4},{2,1,4,4}})
    newShape("shape","bar1_2_1", {2, 1, 7, 5}, "bar", {"vert", 4})
    newTransition("bar1_2_1", "autoSlide", {timePerSquare = 600, pauseTime = 0}, {{2,1,6,5},{2,1,7,5}})
    newShape("autoFan","autoFan4_2_1", {2, 1, 7, 3}, "left")
    newShape("item","compass", {2, 1, 1, 5})
    newShape("autoFan","autoFan5_2_1", {2, 1, 7, 4}, "down")
    newShape("autoFan","autoFan6_2_1", {2, 1, 2, 5}, "up")
    newTransition("autoFan5_2_1", "slide", {"orange"}, {{2,1,2,5},{2,1,3,5}})
    newShape("door","door1_2_1", {2, 1, 4, 5}, "down")
    newShape("simple","simple2_2_1", {2, 1, 5, 5})
    newShape("shape","triangle4_2_1", {2, 1, 6, 5}, "triangleTopAndBottomShape", {1})

    --SCREEN 2-2
    newShape("door","door1_2_2", {2, 2, 2, 1}, "up")
    newShape("simple","simple1_2_2", {2, 2, 2, 1})
    newShape("door","door2_2_2", {2, 2, 5, 1}, "up")
    newShape("autoFan","autoFan1_2_2", {2, 2, 6, 1}, "down")
    newShape("shape","bar1_2_2", {2, 2, 2, 2}, "bar", {"vert", 3})
    newShape("shape","triangle1_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1})
    newTransition("triangle1_2_2", "slide", {"green"}, {{2,2,2,2},{2,2,4,1}})
    newShape("autoFan","autoFan2_2_2", {2, 2, 5, 2}, "up")
    newShape("autoFan","autoFan3_2_2", {2, 2, 6, 2}, "down")
    newShape("shape","bar2_2_2", {2, 2, 7, 3}, "bar", {"vert", 4})
    newTransition("bar2_2_2", "slide", {"brown"}, {{2,2,4,3},{2,2,7,3}})
    newTransition("autoFan3_2_2", "slide", {"orange"}, {{2,2,6,2},{2,2,7,1}})
    newShape("door","door3_2_2", {2, 2, 1, 3}, "left")
    newShape("shape","triangle2_2_2", {2, 2, 4, 3}, "triangleTopLeftShape", {1})
    newTransition("triangle2_2_2", "slide", {"green"}, {{2,2,4,3},{2,2,7,5}})
    newShape("shape","triangle3_2_2", {2, 2, 2, 4}, "triangleTopRightShape", {1})
    newTransition("triangle3_2_2", "slide", {"green"}, {{2,2,2,4},{2,2,2,5}})
    newShape("shape","bar3_2_2", {2, 2, 3, 4}, "bar", {"horz", 4})
    newTransition("bar3_2_2", "slide", {"brown"}, {{2,2,3,3},{2,2,3,4}})
    newShape("shape","bar4_2_2", {2, 2, 4, 4}, "bar", {"horz", 3})
    newShape("autoFan","autoFan4_2_2", {2, 2, 6, 4}, "left")
    newShape("shape","bar5_2_2", {2, 2, 4, 6}, "bar", {"vert", 2})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleTopLeftShape", {1})
    newShape("endPoint","endPoint1_1_2", {1, 2, 4, 1})
    newShape("shape","bar1_1_2", {1, 2, 2, 2}, "bar", {"vert", 3})
    newShape("shape","bar2_1_2", {1, 2, 5, 2}, "bar", {"vert", 2})
    newShape("autoFan","autoFan1_1_2", {1, 2, 3, 2}, "up")
    newShape("simple","simple1_1_2", {1, 2, 6, 3})
    newTransition("simple1_1_2", "slide", {"lightBlue"}, {{1,2,6,2},{1,2,6,3}})
    newShape("shape","bar3_1_2", {1, 2, 2, 3}, "bar", {"horz", 2})
    newShape("shape","bar4_1_2", {1, 2, 6, 3}, "bar", {"horz", 3})
    newShape("shape","bar5_1_2", {1, 2, 4, 5}, "bar", {"vert", 3})
    newShape("simple","simple2_1_2", {1, 2, 3, 5})
    newTransition("simple2_1_2", "slide", {"lightBlue"}, {{1,2,2,5},{1,2,3,5},{1,2,5,5}})

    --GEMS
    newShape("gem","purple", {2, 2, 3, 1}, "purple")
    newShape("gem","purple", {2, 2, 5, 1}, "purple")
    newShape("gem","purple", {2, 2, 6, 5}, "purple")
    newShape("gem","purple", {2, 2, 4, 5}, "purple")
    newShape("gem","purple", {2, 2, 2, 3}, "purple")
    newShape("gem","purple", {2, 2, 1, 3}, "purple")
    newShape("gem","purple", {2, 2, 1, 5}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 2}, "purple")
    newShape("gem","purple", {2, 1, 1, 2}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","redCoin", {2, 1, 1, 4}, "redCoin")
    newShape("gem","blueCoin", {2, 2, 5, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 2, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {2, 1, 4, 5}, 90)
    newShape("item","coins", {2, 2, 3, 5}, 150)
    newShape("item","coins", {1, 2, 4, 3}, 75)
    newShape("item","small-present", {2, 2, 3, 3}, {})

    newShape("item","small-present", {1, 2, 5, 2}, {})

    newShape("item","big-present", {1, 2, 2, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t