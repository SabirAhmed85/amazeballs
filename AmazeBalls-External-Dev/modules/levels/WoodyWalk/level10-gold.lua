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
    newShape("shape","triangle1_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    newShape("item","mystery-block", {1, 1, 6, 3}, {
        {name = "shape", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    })
    newShape("door","door1_1_1", {1, 1, 3, 5}, "down")
    newShape("simple","simple1_1_1", {1, 1, 6, 5})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_1_2", {1, 2, 4, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_2", {1, 2, 5, 1}, "triangleBottomRightShape")
    newShape("door","door1_1_2", {1, 2, 6, 1}, "up")
    newShape("shape","triangle4_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    newShape("item","map", {1, 2, 1, 2})
    newShape("simple","simple1_1_2", {1, 2, 1, 3})
    newShape("shape","bar1_1_2", {1, 2, 5, 3}, "bar", {"vert", 4})
    newTransition("bar1_1_2", "slide", {"brown"}, {{1,2,5,3},{1,2,7,3}})
    newShape("shape","bar2_1_2", {1, 2, 2, 3}, "bar", {"vert", 4})
    newTransition("bar2_1_2", "slide", {"brown"}, {{1,2,2,3},{1,2,4,3}})
    newShape("item","map", {1, 2, 4, 3})
    newShape("shape","bar3_1_2", {1, 2, 5, 4}, "bar", {"vert", 2})
    newTransition("bar3_1_2", "slide", {"brown"}, {{1,2,5,4},{1,2,7,4}})
    newShape("shape","triangle5_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newShape("shape","triangle6_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle7_1_2", {1, 2, 6, 4}, "triangleTopLeftShape")
    newShape("shape","triangle8_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle9_1_2", {1, 2, 5, 5}, "triangleTopLeftShape")
    newShape("door","door2_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 1-3
    newShape("endPoint","endPoint1_1_3", {1, 3, 1, 3})
    newShape("shape","bar1_1_3", {1, 3, 2, 3}, "bar", {"horz", 3})
    newShape("shape","bar2_1_3", {1, 3, 6, 3}, "bar", {"horz", 3})
    newTransition("bar2_1_3", "slide", {"brown"}, {{1,3,3,1},{1,3,4,3},{1,3,5,3},{1,3,6,3}})
    newShape("shape","bar3_1_3", {1, 3, 3, 4}, "bar", {"horz"})
    newTransition("bar3_1_3", "slide", {"brown"}, {{1,3,3,3},{1,3,3,4}})
    newShape("shape","triangle1_1_3", {1, 3, 7, 3}, "triangleTopLeftShape")
    newTransition("triangle1_1_3", "slide", {"green"}, {{1,3,7,3},{1,3,7,4}})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 3, 7, 2}, "purple")
    newShape("gem","purple", {1, 3, 6, 4}, "purple")
    newShape("gem","purple", {1, 3, 4, 4}, "purple")
    newShape("gem","purple", {1, 3, 2, 4}, "purple")
    newShape("gem","purple", {1, 3, 7, 5}, "purple")
    newShape("gem","purple", {1, 3, 3, 3}, "purple")
    newShape("gem","purple", {1, 3, 6, 3}, "purple")
    newShape("gem","redCoin", {1, 2, 7, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 3, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 3, 4}, "purpleCoin")

    newShape("item","coins", {1, 1, 1, 3, 375})
    newShape("item","coins", {1, 2, 7, 3}, 55))
    newShape("item","coins", {1, 3, 2, 3, 140}) 
    newShape("item", "small-present", {1, 1, 6, 1}, {})

    addToTransitionArray(shapeArrayParameters,  {"item","big-present", {1, 2, 6, 2, "present2_1_1", 
                                            { 
                                                {"item","clock", {1, 2, 3, 2, "clock1_1_1", 10, 1},
                                                {"triangle", "triangleTopRightShape"},
                                                {"spitter", {"up", "right", "down", "left"} },
                                                {"manualFan", "right"},
                                                {"manualFan", "down"},
                                                {"autoFan", "down"}
                                            } 
                                        } ) 

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
