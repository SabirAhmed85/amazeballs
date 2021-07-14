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

    -- 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 1}, "triangleTopRightShape")
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 1}, "down")
    newShape("shape", "triangle3_1_1", {1, 1, 3, 2}, "triangleLeftAndRightShape", {2})
    newTransition("triangle3_1_1", "flip-horizontal")
    newShape("item", "mystery-block", {1, 1, 7, 2}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"none", "right", "down", "left"} } }
    })
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 3}, "down")
    newShape("shape", "triangle4_1_1", {1, 1, 4, 4}, "triangleTopAndBottomShape", {2})
    newShape("shape", "triangle5_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle6_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "fire"})
    newShape("simple", "simple1_1_1", {1, 1, 3, 5})
    newShape("shape", "triangle7_1_1", {1, 1, 6, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "bar1_1_1", {1, 1, 6, 5}, "bar", {"horz", 2})
    newTransition("bar1_1_1", "switchSlide", {}, {{1,1,6,3},{1,1,6,5}})
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "down")

    -- SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("shape", "bar1_1_2", {1, 2, 6, 1}, "bar", {"vert", 2})
    newShape("shape", "triangle1_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,5,2},{1,2,6,1}})
    newShape("shape", "triangle2_1_2", {1, 2, 1, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle3_1_2", {1, 2, 4, 3}, "triangleTopRightShape")
    newTransition("triangle3_1_2", "slide", {}, {{1,2,3,4},{1,2,3,3,"*"},{1,2,4,3}})
    newShape("shape", "triangle4_1_2", {1, 2, 5, 3}, "triangleTopLeftShape")
    newTransition("triangle4_1_2", "slide", {}, {{1,2,5,3},{1,2,6,4}})
    newShape("shape", "triangle5_1_2", {1, 2, 1, 4}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "bar2_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 5})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 2, 2}, { {"slide", "bar1_1_1"} }, {"one-way"})
    newShape("switch", "switch2_1_1", {1, 1, 3, 4}, { {"flip-horizontal", "triangle2_1_1"} })


    --GEMS
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "redCoin", {1, 2, 7, 2}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 6, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 1, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 5, 3}, 270)
    newShape("item", "coins", {1, 1, 1, 4}, 200) 
    newShape("item", "coins", {1, 2, 2, 1}, 40)
    newShape("item", "coins", {1, 2, 4, 1}, 65)
    newShape("item", "small-present", {1, 1, 5, 2}, {})

    newShape("item", "small-present", {1, 2, 2, 3}, {})

    newShape("item", "bombs", {1, 2, 7, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
