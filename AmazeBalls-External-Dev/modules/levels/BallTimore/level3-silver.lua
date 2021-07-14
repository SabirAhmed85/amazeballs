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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopAndBottomShape", {2})
    newShape("shape","triangle2_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {1})
    newShape("backFire","backFire1_1_1", {1, 1, 2, 2})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,1,2},{1,1,2,2},{1,1,3,2}})
    newShape("item","map", {1, 1, 2, 4})
    newShape("gun","gun1_1_1", {1, 1, 3, 4}, "right")
    newShape("shape","bar1_1_1", {1, 1, 1, 5}, "bar", {"vert", 2})
    newShape("tunnel","tunnel1_1_1", {1, 1, 1, 5, 1, 2, 7, 5, "none"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 5}, "left")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,5,5},{1,1,6,5}})
    newShape("shape","bar2_1_1", {1, 1, 1, 6}, "bar", {"vert", 2})
    newTransition("bar2_1_1", "switchSlide", {}, {{1,1,1,6},{1,1,2,6}})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 2, 1}, "up")
    newShape("spitter","spitter1_1_2", {1, 2, 4, 1}, {"none","none","down","none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,2,1},{1,2,3,1},{1,2,4,1}})
    newShape("gun","gun1_1_2", {1, 2, 3, 2}, "right")
    newShape("shape","bar1_1_2", {1, 2, 2, 3}, "bar", {"horz", 4})
    newTransition("bar1_1_2", "slide", {}, {{1,2,2,3},{1,2,2,4}})
    newShape("manualFan","manualFan1_1_2", {1, 2, 5, 3}, "down")
    newShape("tunnel","tunnel2_1_2", {1, 2, 6, 3, 1, 2, 3, 5}, "right")
    newShape("endPoint","endPoint1_1_2", {1, 2, 7, 3})
    newShape("shape","bar2_1_2", {1, 2, 1, 5}, "bar", {"vert"})
    newTransition("bar2_1_2", "slide", {}, {{1,2,1,5},{1,2,2,5}})
    newShape("manualFan","manualFan2_1_2", {1, 2, 4, 5}, "up")
    newShape("tunnel","tunnel3_1_2", {1, 2, 5, 5, 1, 2, 4, 3, "none"})
    newShape("shape","bar3_1_2", {1, 2, 2, 6}, "bar", {"vert", 2})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 2, 3}, { {"slide","bar2_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 3, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 4, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 7, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 1, 4}, 185)
    newShape("item","coins", {1, 1, 6, 2}, 70)
    newShape("item","small-present", {1, 1, 3, 5}, {})

    newShape("item","big-present", {1, 1, 7, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
