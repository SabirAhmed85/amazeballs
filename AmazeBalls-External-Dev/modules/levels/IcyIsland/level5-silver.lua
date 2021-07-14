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
    newShape("autoFan","autoFan1_1_1", {1, 1, 4, 1}, "up")
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"horz", 4})
    newTransition("bar1_1_1", "switchSlide", {}, {{1,1,5,2},{1,1,5,3}})
    newShape("spitter","spitter1_1_1", {1, 1, 7, 3}, {"none","none","none","left"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,7,1},{1,1,7,2},{1,1,7,3}})
    newShape("backFire","backFire1_1_1", {1, 1, 2, 4}, "up")
    newTransition("backFire1_1_1", "slide", {}, {{1,1,1,2},{1,1,2,3},{1,1,2,4}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 3, 4}, "right")
    newShape("shape","bar2_1_1", {1, 1, 4, 4}, "bar", {"vert", 4})
    newTransition("bar2_1_1", "switchSlide", {}, {{1,1,3,4},{1,1,4,4}})
    newShape("shape","triangle2_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape", {1, 3, "breakable"})
    newShape("autoFan","autoFan3_1_1", {1, 1, 6, 4}, "down")
    newShape("shape","triangle2_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, 3})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,7,4},{1,1,7,5}})
    newShape("autoFan","autoFan4_1_1", {1, 1, 3, 5}, "right")
    newTransition("autoFan4_1_1", "slide", {}, {{1,1,3,5},{1,1,4,5}})
    newShape("door","door1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape", {1, 4, "breakable"})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    newShape("item","big-present", {1, 2, 7, 3}, {})

    newShape("shape","triangle3_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_1_2", {1, 2, 7, 4})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 3, 3}, { {"slide","bar1_1_1"},{"slide","bar2_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","redCoin", {2, 1, 3, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 2, 5}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 1, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 1, 4, 235})
    newShape("item","coins", {1, 2, 4, 1}, 170)
    newShape("item","big-present", {1, 1, 6, 5}, {})
    newShape("item","small-present", {1, 1, 5, 5}, {})
    newShape("item","small-present", {1, 2, 1, 1}, {})
    newShape("item","hook", {2, 1, 6, 3}, {})
    newShape("item","dummyBall", {1, 2, 2, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
