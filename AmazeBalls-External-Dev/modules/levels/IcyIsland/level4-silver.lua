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
    newShape("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 3}, "up")
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 4}, "down")
    newShape("endPoint","endPoint1_1_1", {1, 1, 3, 3})

    --SCREEN 2-1
    newShape("autoFan","autoFan1_2_1", {2, 1, 1, 1}, "down")
    newShape("autoFan","autoFan2_2_1", {2, 1, 3, 1}, "left")
    newShape("autoFan","autoFan3_2_1", {2, 1, 5, 1}, "down")
    newShape("autoFan","autoFan4_2_1", {2, 1, 7, 1}, "left")
    newShape("autoFan","autoFan5_2_1", {2, 1, 2, 2}, "down")
    newShape("autoFan","autoFan6_2_1", {2, 1, 4, 2}, "left")
    newTransition("autoFan6_2_1", "slide", {}, {{2,1,4,2},{2,1,5,2}})
    newShape("autoFan","autoFan7_2_1", {2, 1, 6, 2}, "up")
    newTransition("autoFan7_2_1", "slide", {}, {{2,1,6,1},{2,1,6,2}})
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("autoFan","autoFan8_2_1", {2, 1, 5, 3}, "right")
    newShape("autoFan","autoFan9_2_1", {2, 1, 7, 3}, "up")
    newShape("autoFan","autoFan10_2_1", {2, 1, 1, 4}, "right")
    newShape("autoFan","autoFan11_2_1", {2, 1, 3, 4}, "up")
    newShape("autoFan","autoFan12_2_1", {2, 1, 6, 4}, "left")
    newTransition("autoFan12_2_1", "slide", {}, {{2,1,6,3},{2,1,6,4}})
    newShape("autoFan","autoFan13_2_1", {2, 1, 2, 5}, "right")
    newShape("autoFan","autoFan14_2_1", {2, 1, 4, 5}, "up")
    newShape("manualFan","manualFan1_2_1", {2, 1, 5, 5}, "left")
    newTransition("manualFan1_2_1", "slide", {}, {{2,1,3,3},{2,1,4,3,"*"},{2,1,4,4,"*"},{2,1,5,4},{2,1,5,5}})

    --SCREEN 2-2
    newShape("spitter","spitter1_2_2", {2, 2, 2, 1}, {"none","right","none","none"})
    newTransition("spitter1_2_2", "slide", {}, {{2,2,2,1},{2,2,2,3},{2,2,2,5}})
    newShape("door","door1_2_2", {2, 2, 7, 1}, "up")
    newShape("spitter","spitter2_2_2", {2, 2, 5, 2}, {"none","none","none","left"})
    newTransition("spitter2_2_2", "slide", {}, {{2,2,5,1},{2,2,5,2},{2,2,5,4}})
    newShape("shape","triangle2_2_2", {2, 2, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_2", {2, 2, 4, 5}, "triangleBottomRightShape", {1, 14, "breakable"})
    newShape("shape","triangle2_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --GEMS
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {2, 1, 6, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 7, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 2, 3, 1}, "purple")
    newShape("gem","purple", {2, 2, 4, 1}, "purple")
    newShape("gem","purple", {2, 2, 7, 1}, "purple")
    newShape("gem","purple", {2, 2, 1, 2}, "purple")
    newShape("gem","purple", {2, 2, 3, 2}, "purple")
    newShape("gem","purple", {2, 2, 4, 2}, "purple")
    newShape("gem","purple", {2, 2, 6, 2}, "purple")
    newShape("gem","purple", {2, 2, 1, 3}, "purple")
    newShape("gem","purple", {2, 2, 3, 3}, "purple")
    newShape("gem","purple", {2, 2, 7, 3}, "purple")
    newShape("gem","purple", {2, 2, 1, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 4}, "purple")
    newShape("gem","purple", {2, 2, 6, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 5}, "purple")
    newShape("gem","purple", {2, 2, 5, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 1, 1}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 1, 2}, "blueCoin")
    newShape("gem","purpleCoin", {2, 2, 1, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 1}, 27)
    newShape("item","coins", {2, 2, 6, 1}, 135)
    newShape("item","coins", {2, 2, 4, 4}, 80)
    newShape("item","big-present", {1, 1, 6, 5}, {})
    newShape("item","small-present", {1, 1, 6, 1}, {})
    newShape("item","small-present", {2, 1, 4, 1}, {})
    newShape("item","hook", {2, 1, 7, 2}, {})
    newShape("item","clock", {2, 2, 6, 5}, {})

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
