local addToTransitionArray = function (transitionArray, shapeName, transitionType, props, startPositionIndex, positionArray)
print("local", shapeName, transitionType, startPositionIndex);
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