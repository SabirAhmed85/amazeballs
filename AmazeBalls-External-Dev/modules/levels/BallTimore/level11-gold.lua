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
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle3_1_1", {1, 1, 7, 2}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape","triangle4_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("spitter","spitter1_1_1", {1, 1, 3, 3}, {"none","right","down","none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,3,2},{1,1,3,3}})
    newShape("spitter","spitter2_1_1", {1, 1, 5, 3}, {"none","none","none","left"})
    newTransition("spitter2_1_1", "slide", {}, {{1,1,5,2},{1,1,5,3}})
    newShape("shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","triangle6_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle7_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape","triangle8_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("spitter","spitter3_1_1", {1, 1, 4, 5}, {"none","right","down","none"})
    newTransition("spitter3_1_1", "slide", {}, {{1,1,4,4},{1,1,4,5}})
    newShape("spitter","spitter4_1_1", {1, 1, 5, 5}, {"none","none","none","left"})
    newTransition("spitter4_1_1", "slide", {}, {{1,1,5,4},{1,1,5,5}})

    --SCREEN 2-1
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 1}, "down")
    newShape("shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door1_2_1", {2, 1, 7, 1}, "right")
    newShape("backFire","backFire1_2_1", {2, 1, 2, 2})
    newTransition("backFire1_2_1", "slide", {}, {{2,1,1,2},{2,1,2,2}})
    newShape("shape","bar1_2_1", {2, 1, 3, 4}, "bar", {"vert"})
    newTransition("bar1_2_1", "slide", {}, {{2,1,2,4},{2,1,3,4}})
    newShape("shape","triangle1_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_2_1", {2, 1, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    newShape("shape","triangle1_2_1", {2, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("gem","blueCoin", {2, 1, 6, 5}, "blueCoin")
    newShape("shape","bar2_2_1", {2, 1, 7, 5}, "bar", {"vert"})
    newTransition("bar2_2_1", "slide", {}, {{2,1,6,5},{2,1,7,5}})

    --SCREEN 3-1
    newShape("autoFan","autoFan1_3_1", {3, 1, 2, 1}, "right")
    newShape("autoFan","autoFan2_3_1", {3, 1, 4, 1}, "down")
    newShape("shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 6, 2}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 7, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door","door1_3_1", {3, 1, 7, 2}, "right")
    newShape("autoFan","autoFan3_3_1", {3, 1, 2, 3}, "up")
    newShape("autoFan","autoFan4_3_1", {3, 1, 4, 3}, "left")
    newShape("item","coins", {3, 1, 7, 3, 999})
    newShape("shape","triangle1_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","bar1_3_1", {3, 1, 5, 4}, "bar", {"horz", 2})
    newShape("autoFan","autoFan5_3_1", {3, 1, 7, 4}, "down")
    newTransition("autoFan5_3_1", "slide", {}, {{3,1,7,4},{3,1,7,5}})
    newShape("shape","triangle1_3_1", {3, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})

    --SCREEN 4-1
    newShape("endPoint","endPoint1_4_1", {4, 1, 5, 1})
    newShape("tunnel","tunnnel1_4_1", {4, 1, 7, 1, 4, 1, 4, 1}, "down")
    --newShape("timeOut","timeOut1_4_1", {4, 1, 2, 2})
    newShape("autoFan","autoFan1_4_1", {4, 1, 7, 2}, "up")
    newShape("shape","triangle1_4_1", {4, 1, 2, 4}, "triangleTopRightShape")
    newTransition("triangle1_4_1", "slide", {}, {{4,1,2,4},{4,1,4,4}})
    newShape("shape","bar1_4_1", {4, 1, 5, 4}, "bar", {"horz", 2})
    newTransition("bar1_4_1", "slide", {}, {{4,1,5,4},{4,1,5,5}})
    newShape("tunnel","tunnel2_4_1", {4, 1, 7, 4, 4, 1, 1, 5, "none"})
    newShape("shape","bar2_4_1", {4, 1, 4, 6}, "bar", {"vert", 2})
    newShape("autoFan","autoFan2_4_1", {4, 1, 5, 5}, "up")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 4
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
