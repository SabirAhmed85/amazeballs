local getStartPosition;

local addToTransitionArray = function (transitionArray, shapeArrayParameters, shapeName, transitionType, props, positionArray)
print("local", shapeName, transitionType);
    table.insert(transitionArray, {
        shapeName = shapeName,
        transitionType = transitionType,
        props = props,
        startPositionIndex = positionArray and getStartPosition(shapeName, positionArray, shapeArrayParameters),
        positionArray = positionArray
    });
end;

getStartPosition = function (shapeName, positionArray, shapeArrayParameters)
    for a = 1, #shapeArrayParameters do
        if shapeArrayParameters[a]["name"] == shapeName then
            for b = 1, #positionArray do
                if positionArray[b][1] == shapeArrayParameters[a]["location"]["xScreen"]
                and positionArray[b][2] == shapeArrayParameters[a]["location"]["yScreen"]
                and positionArray[b][3] == shapeArrayParameters[a]["location"]["xSquare"]
                and positionArray[b][4] == shapeArrayParameters[a]["location"]["ySquare"] then
                    return b;
                end
            end
        end 
    end
end

return addToTransitionArray;