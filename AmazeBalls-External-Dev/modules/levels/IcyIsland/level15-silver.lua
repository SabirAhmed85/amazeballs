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
    newShape("shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 3})
    newShape("shape","bar2_1_1", {1, 1, 1, 2}, "bar", {"horz"})
    newTransition("bar2_1_1", "slide", {}, {{1,1,1,2},{1,1,1,5}})
    newShape("shape","bar3_1_1", {1, 1, 2, 3}, "bar", {"horz", 3})
    newTransition("bar3_1_1", "slide", {}, {{1,1,2,3},{1,1,2,4}})
    newShape("shape","triangle1_1_1", {1, 1, 5, 3}, "triangleTopRightShape")
    newTransition("triangle1_1_1", "flip-horizontal")
    newShape("shape","bar4_1_1", {1, 1, 4, 4}, "bar", {"vert", 4})
    newShape("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "flip-horizontal")
    newShape("simple","simple1_1_1", {1, 1, 2, 5})
    newShape("manualFan","manualFan1_1_1", {1, 1, 3, 5}, "down")
    newTransition("manualFan1_1_1", "switchSlide", {}, {{1,1,3,5},{1,1,4,5}})
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")
    newShape("shape","triangle3_1_1", {1, 1, 7, 5}, "triangleBottomRightShape", {1, 3, "breakable"})

    --SCREEN 1-2
    newShape("spitter","spitter1_1_2", {1, 2, 3, 1}, {"none", "none", "down", "none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,2,1},{1,2,3,1}})
    newShape("spitter","spitter2_1_2", {1, 2, 4, 2}, {"none", "none", "down", "none"})
    newTransition("spitter2_1_2", "slide", {}, {{1,2,4,2},{1,2,5,2}})
    newShape("shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"vert", 4})
    newTransition("bar1_1_2", "autoSlide", {}, {{1,2,2,3},{1,2,3,3}})
    newShape("shape","bar2_1_2", {1, 2, 5, 4}, "bar", {"vert", 2})
    newTransition("bar2_1_2", "autoSlide", {}, {{1,2,4,4},{1,2,5,4}})
    newShape("endPoint","endPoint1_1_2", {1, 2, 2, 5})
    newShape("spitter","spitter3_1_2", {1, 2, 5, 5, "up", "none", "none", "none"})
    newTransition("spitter3_1_2", "slide", {}, {{1,2,3,5},{1,2,5,5}})


    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 6, 5}, { {"slide","manualFan1_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 1, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 4, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 7, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 3}, 50)
    newShape("item","coins", {1, 1, 7, 1}, 500)
    newShape("item","small-present", {1, 1, 1, 4}, {})

    newShape("item","big-present", {1, 2, 2, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
