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
    
    
    --newShape("shape", "triangle1_1_1", {1, 1, 2, 2}, "triangleLeftAndRightShape", {1})

    newShape("simple", "simple1_1_1", {1, 1, 6, 1})
    newTransition("simple1_1_1", "switchSlide", {labelled = false}, {{1,1,6,1},{1,1,6,2}})

    newShape("shape", "triangle2_1_1", {1, 1, 1, 1}, "triangleTopRightShape", {1, _, "hyroll"})

    newShape("simple", "simple2_1_1", {1, 1, 5, 5}, "right")
    --newTransition("simple2_1_1", "slide", {}, {{1,1,3,3},{1,1,3,5}})
    -- if autoslide object is activeWhenSliding, then it must slide slowly
    newTransition("simple2_1_1", "autoSlide", {timePerSquare = 500, pauseTime = 0}, {{1,1,3,2},{1,1,3,5},{1,1,5,5}})
    -- SWITCHSLIDE alternative
    --newTransition("simple2_1_1", "switchSlide", {timePerSquare = 500, pauseTime = 0, isEnabledByDefault = true, labelled = false}, {{1,1,3,2},{1,1,3,3},{1,1,3,5},{1,1,5,5}})
    --
    --newTransition("simple2_1_1", "autoSlide", {timePerSquare = 200, pauseTime = 400, labelled = false, isActiveWhenSliding = false}, {{1,1,3,2},{1,1,3,4},{1,1,3,5},{1,1,5,5}})

newShape("simple", "fan1_1_1", {1, 1, 5, 4})

    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 6, 3})

    newShape("endPoint", "endPoint1_1_1", {1, 1, 7, 5})


    --
    --newShape("switch", "switch1", {1, 1, 1, 3, { {"toggle-slide", "simple2_1_1"} })


    newShape("switch", "switch2", {1, 1, 1, 3}, { {"slide", "simple1_1_1"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t