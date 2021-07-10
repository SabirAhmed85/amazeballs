local addToShapeArray = function (shapeArrayParameters, type, name, location, subType, props)
    local props = props or {};
    
    local shape = {
        type = type,
        name = name,
        location = {
            xScreen = location[1],
            yScreen = location[2],
            xSquare = location[3],
            ySquare = location[4]
        },
        subType = subType,
        props = props
    };

    table.insert(shapeArrayParameters, shape);
end;

return addToShapeArray;