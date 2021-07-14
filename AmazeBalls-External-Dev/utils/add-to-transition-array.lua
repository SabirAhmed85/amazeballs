local addToTransitionArray = function (transitionArray, shapeArrayParameters, shapeName, transitionType, props, positionArray)
print("local", shapeName, transitionType);
    local startPositionIndex;
    for a = 1, #shapeArrayParameters do
        if shapeArrayParameters[a]["name"] == shapeName then
            for b = 1, #positionArray do
                if positionArray[b][1] == shapeArrayParameters[a]["location"]["xScreen"]
                and positionArray[b][2] == shapeArrayParameters[a]["location"]["yScreen"]
                and positionArray[b][3] == shapeArrayParameters[a]["location"]["xSquare"]
                and positionArray[b][4] == shapeArrayParameters[a]["location"]["ySquare"] then
                    startPositionIndex = b;
                end
            end
        end 
    end

    local item = {
        shapeName = shapeName,
        transitionType = transitionType,
        props = props,
        startPositionIndex = startPositionIndex,
        positionArray = positionArray
    };
    table.insert(transitionArray, item);
end;

return addToTransitionArray;