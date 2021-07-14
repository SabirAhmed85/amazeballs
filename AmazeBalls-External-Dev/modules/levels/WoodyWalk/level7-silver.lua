local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;	-- 1-1
    newShape("tunnel","tunnel1", {1, 1, 1, 1}, "down", {2, 1, 2, 1})
    newShape("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"horz"})

    newShape("shape","triangle1_1_1", {1, 1, 2, 2}, "triangleLeftAndRightShape", {1})

    newShape("simple","simple1_1_1", {1, 1, 6, 1})
    newTransition("simple1_1_1", "slide", {}, {{1,1,6,1},{1,1,6,2},{1,1,6,3}})

    newShape("shape","bar2_1_1", {1, 1, 8, 1}, "bar", {"horz"})

    newShape("shape","triangle2_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "breakable"})

    newShape("simple","simple2_1_1", {1, 1, 3, 4})
    newTransition("simple2_1_1", "slide", {"lightBlue"}, {{1,1,3,3},{1,1,3,4}})

    newShape("endPoint","endPoint1_1_1", {1, 1, 7, 4})

    newShape("shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape")

    newShape("shape","triangle4_1_1", {1, 1, 4, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    -- 2-1
    newShape("simple","simple1_2_1", {2, 1, 5, 1}, "up")
    newTransition("simple1_2_1", "slide", {"lightBlue"}, {{2,1,3,1},{2,1,5,1}})
    newShape("backFire","backFire1_2_1", {2, 1, 6, 2}, "up")
    newTransition("backFire1_2_1", "slide", {"lightDarkBlue"}, {{2,1,4,2},{2,1,6,2}})
    newShape("backFire","backFire2_2_1", {2, 1, 2, 3}, "up")
    newTransition("backFire2_2_1", "slide", {"lightDarkBlue"}, {{2,1,2,3},{2,1,3,3},{2,1,4,3}})
    newShape("simple","simple2_2_1", {2, 1, 5, 3}, "up")
    newTransition("simple2_2_1", "slide", {"lightBlue"}, {{2,1,5,3},{2,1,7,3}})
    newShape("shape","triangle1_2_1", {2, 1, 2, 4}, "triangleBottomRightShape")
    newShape("door","door1_2_1", {2, 1, 1, 5}, "left")
    newShape("shape","triangle2_2_1", {2, 1, 2, 5}, "triangleTopLeftShape")
    newShape("shape","bar1_2_1", {2, 1, 4, 5}, "bar", {"horz", 3})
    newShape("shape","bar2_2_1", {2, 1, 4, 6}, "bar", {"vert", 2})
    newShape("shape","triangle3_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")
    newTransition("triangle3_2_1", "slide", {"green"}, {{2,1,4,4},{2,1,5,5},{2,1,6,5}})

    --GEMS
    newShape("gem","purple", {2, 1, 3, 4}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 7, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 1, 4}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 4, 5}, "purpleCoin")

    --ITEMS   
    newShape("item","coins", {1, 1, 3, 5}, 350)
    newShape("item","coins", {1, 1, 2, 1}, 90)
    newShape("item","clock", {1, 1, 3, 1, 2, 3 })    
    newShape("item","small-present", {2, 1, 6, 4}, {})

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
