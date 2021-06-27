local t = {}
local widget = require("widget")

local addFlipIndicatorTriangles = function (mainFunc, shapeArray, shapeArrayParameters)
    shapeArray[thisFlippingShapeIndex].isLabelled = true

    shapeArray[thisFlippingShapeIndex].flipTriangle = display.newImageRect("images/objects/flipPosition-arrow.png", 15, 10)
    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[thisFlippingShapeIndex].flipTriangle )
    shapeArray[thisFlippingShapeIndex].flipTriangle.x = shapeArray[thisFlippingShapeIndex].x
    shapeArray[thisFlippingShapeIndex].flipTriangle.y = shapeArray[thisFlippingShapeIndex].y
    
    local flipIndicatorTrianglePositioningArray = {
        {"triangleTopLeftShape", 14, 10, 12, 14, 90, 180},
        {"triangleTopRightShape", -14, 10, -11, 14, -90, 180},
        {"triangleBottomRightShape", -14, -11, -11, -15, -90, 0},
        {"triangleBottomLeftShape", 14, -11, 12, -15,  90, 0},
        {"triangleLeftAndRightShape", -13, -2, 0, 0, -90, 0}
    }
    
    for a =1, #flipIndicatorTrianglePositioningArray do
        if shapeArrayParameters[thisFlippingShapeIndex]["subType"] == flipIndicatorTrianglePositioningArray[a][1] then
            if thisFlipTransitionDirection == "flip-horizontal" then
                shapeArray[thisFlippingShapeIndex].flipTriangle.x  = shapeArray[thisFlippingShapeIndex].flipTriangle.x + flipIndicatorTrianglePositioningArray[a][2]
                shapeArray[thisFlippingShapeIndex].flipTriangle.y  = shapeArray[thisFlippingShapeIndex].flipTriangle.y + flipIndicatorTrianglePositioningArray[a][3]
                shapeArray[thisFlippingShapeIndex].flipTriangle.rotation = flipIndicatorTrianglePositioningArray[a][6]
            elseif thisFlipTransitionDirection == "flip-vertical" then
                shapeArray[thisFlippingShapeIndex].flipTriangle.x  = shapeArray[thisFlippingShapeIndex].flipTriangle.x + flipIndicatorTrianglePositioningArray[a][4]
                shapeArray[thisFlippingShapeIndex].flipTriangle.y  = shapeArray[thisFlippingShapeIndex].flipTriangle.y + flipIndicatorTrianglePositioningArray[a][5]
                shapeArray[thisFlippingShapeIndex].flipTriangle.rotation = flipIndicatorTrianglePositioningArray[a][7]
            end
        end
    end

end
    t.addFlipIndicatorTriangles = addFlipIndicatorTriangles

return t
