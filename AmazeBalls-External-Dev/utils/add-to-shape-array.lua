local createLocation = require("utils.create-location");

local addToShapeArray = function (shapeArrayParameters, type, name, location, subType, props)
    table.insert(shapeArrayParameters, {
        type = type,
        name = name,
        location = createLocation(location[1], location[2], location[3], location[4]),
        subType = subType,
        props = props or {}
    });
end;

return addToShapeArray;