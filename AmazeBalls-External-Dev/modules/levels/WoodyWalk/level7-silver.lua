local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;	-- 1-1
    addToShapeArray(sp, "tunnel","tunnel1", {1, 1, 1, 1}, "down", {2, 1, 2, 1})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"horz"})

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleLeftAndRightShape", {1})

    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 1})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,6,1},{2},{1,1,6,2},{3},{1,1,6,3}})

    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 8, 1}, "bar", {"horz"})

    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 3, 4})
    addToTransitionArray(ta,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,3},{2},{1,1,3,4}})

    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 4})

    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape")

    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    -- 2-1
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 5, 1}, "up")
    addToTransitionArray(ta,{{"simple1_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,3,1},{2},{2,1,5,1}})
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 6, 2}, "up")
    addToTransitionArray(ta,{{"backFire1_2_1"},{"slide"},{"lightDarkBlue"},{2},{1},{2,1,4,2},{2},{2,1,6,2}})
    addToShapeArray(sp, "backFire","backFire2_2_1", {2, 1, 2, 3}, "up")
    addToTransitionArray(ta,{{"backFire2_2_1"},{"slide"},{"lightDarkBlue"},{1},{1},{2,1,2,3},{2},{2,1,3,3},{3},{2,1,4,3}})
    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 5, 3}, "up")
    addToTransitionArray(ta,{{"simple2_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,5,3},{2},{2,1,7,3}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 4, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 4, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle3_2_1"},{"slide"},{"green"},{3},{1},{2,1,4,4},{2},{2,1,5,5},{3},{2,1,6,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 4, 5}, "purpleCoin")

    --ITEMS   
    addToShapeArray(sp, "item","coins", {1, 1, 3, 5}, 350)
    addToShapeArray(sp, "item","coins", {1, 1, 2, 1}, 90)
    addToShapeArray(sp, "item","clock", {1, 1, 3, 1, 2, 3 })    
    addToShapeArray(sp, "item","small-present", {2, 1, 6, 4}, {})

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
