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
    newShape("shape","bar1_1_1", {1, 1, 3, 1}, "bar", {"vert", 3})
    newShape("shape","bar2_1_1", {1, 1, 5, 1}, "bar", {"vert", 3})
    newShape("spitter","spitter1_1_1", {1, 1, 7, 1}, {"none", "none", "down", "none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,2,1},{1,1,7,1}})
    newShape("autoFan","autoFan1_1_1", {1, 1, 4, 2}, "left")
    newShape("shape","bar3_1_1", {1, 1, 5, 2}, "bar", {"vert"})
    newTransition("bar3_1_1", "slide", {}, {{1,1,3,2},{1,1,5,2}})
    newShape("shape","bar4_1_1", {1, 1, 1, 3}, "bar", {"vert", 4})
    newTransition("bar4_1_1", "switchSlide", {}, {{1,1,1,3},{1,1,3,3}})
    newShape("shape","triangle1_1_1", {1, 1, 1, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 4, 3}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("shape","triangle3_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("item","map", {1, 1, 2, 4})
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 4}, "left")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,6,4},{1,1,7,3}})
    newShape("shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("door","door1_1_1", {1, 1, 2, 5}, "down")
    newShape("door","door2_1_1", {1, 1, 3, 5}, "down")
    newShape("door","door3_1_1", {1, 1, 5, 5}, "down")
    newShape("shape","bar5_1_1", {1, 1, 6, 5}, "bar", {"vert", 3})
    newTransition("bar5_1_1", "switchSlide", {}, {{1,1,5,5},{1,1,6,5}})
    newShape("shape","bar6_1_1", {1, 1, 6, 5}, "bar", {"horz", 2})
    newShape("endPoint","endPoint1_1_1", {1, 1, 6, 5})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 2, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 3, 1}, "up")
    newShape("door","door3_1_2", {1, 2, 5, 1}, "up")
    newShape("spitter","spitter1_1_2", {1, 2, 2, 3}, "up")
    newTransition("spitter1_1_2", "slide", {}, {{1,2,2,3},{1,2,3,3},{1,2,5,3},{1,2,7,3}})
    --newShape("item","coins", {1, 2, 5, 5}, 50)
    newShape("shape","bar1_1_2", {1, 2, 3, 6}, "bar", {"vert"})
    newShape("shape","bar2_1_2", {1, 2, 5, 6}, "bar", {"vert"})

    --SWITCHES
    newShape("switch","switch1_1_2", {1, 2, 5, 4}, { {"slide","bar4_1_1"},{"slide","bar5_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","redCoin", {1, 2, 3, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 1, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 7, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 2}, 55)
    newShape("item","coins", {1, 2, 2, 5}, 160)
    newShape("item","small-present", {1, 1, 6, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
